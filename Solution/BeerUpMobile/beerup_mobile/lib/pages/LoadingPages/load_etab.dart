import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/models/HoraireModel.dart';
import 'package:beerup_mobile/models/JourFermetureModel.dart';
import 'package:beerup_mobile/services/CallApi/HoraireService.dart';
import 'package:beerup_mobile/services/CallApi/JourFermetureService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadEtab extends StatefulWidget {
  @override
  _LoadEtabState createState() => _LoadEtabState();
}

class _LoadEtabState extends State<LoadEtab> {
  Map data = {};
  Etablissement etab;
  List<Horaire> lHoraires;
  List<JourFermeture> lJours;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    etab = data['etab'];
    if (etab != null && etab.etaId != null) {
      lHoraires = await HoraireService().getHoraires(etab.etaId);
      lJours = await JourFermetureService().getJours(etab.etaId);

      etab.checkDate(lJours);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var noPicture = prefs.getString('noPicture');
      var etabPicture = prefs.getString('etabPicture');

      Navigator.pushReplacementNamed(context, '/etab', arguments: {
        'etab': etab,
        'noPicture': noPicture,
        'etabPicture': etabPicture,
        'lHoraires': lHoraires,
        'lJours': lJours,
      });
    } else {
      Navigator.pushReplacementNamed(context, '/notFound');
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
