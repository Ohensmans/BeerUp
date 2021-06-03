import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadResultats extends StatefulWidget {
  @override
  _LoadResultatsState createState() => _LoadResultatsState();
}

class _LoadResultatsState extends State<LoadResultats> {
  Map data = {};
  String text;
  List<Biere> lBieres;
  List<Etablissement> lEtabs;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    text = data['text'];
    if (text != null && text.isNotEmpty) {
      load(text);
    } else {
      Navigator.pushReplacementNamed(context, '/load_home');
    }
  }

  load(String text) async {
    lBieres = await BiereService().searchBiere(text);
    lEtabs = await EtabService().searchEtab(text);

    //erreur dans le chargement => vers home page
    if (lBieres == null || lEtabs == null) {
      Navigator.pushReplacementNamed(context, '/load_home');
    }

    //aucun résultat
    else if (lBieres != null &&
        lBieres.isEmpty &&
        lEtabs != null &&
        lEtabs.isEmpty) {
      Navigator.pushNamed(context, '/notFound');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var ressourceBaseUrl = prefs.getString('ressourceBaseUrl');
      var noPicture = prefs.getString('noPicture');
      Navigator.pushReplacementNamed(context, '/resultats', arguments: {
        'lBieres': lBieres,
        'lEtabs': lEtabs,
        'ressourceBaseUrl': ressourceBaseUrl,
        'noPicture': noPicture
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
