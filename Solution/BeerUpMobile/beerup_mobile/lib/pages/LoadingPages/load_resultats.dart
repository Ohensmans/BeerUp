import 'package:beerup_mobile/models/JourFermetureModel.dart';
import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:beerup_mobile/services/CallApi/JourFermetureService.dart';
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
  List<bool> lIsFavorite = [];

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

    for (var i = 0; i < lBieres.length; i++) {
      bool isFav = await FavorisService().isFavoris(lBieres[i].bieId);
      lIsFavorite.add(isFav);
    }

    //aucun résultat
    if (lBieres != null &&
        lBieres.isEmpty &&
        lEtabs != null &&
        lEtabs.isEmpty) {
      Navigator.pushNamed(context, '/notFound');
    } else {
      List<Biere> lBiereSpon = [];
      List<bool> lSponIsFav = [];
      List<Etablissement> lEtaSponso = [];

      if (lBieres.isNotEmpty) {
        Biere biereSpon = await BiereService().getBiereSponsorisee(false);
        if (biereSpon != null) {
          lBiereSpon.add(biereSpon);
          bool isFav = await FavorisService().isFavoris(biereSpon.bieId);
          lSponIsFav.add(isFav);
        }
      }

      if (lEtabs.isNotEmpty) {
        Etablissement etaSponso = await EtabService().getEtabSponso();
        if (etaSponso != null || etaSponso.etaId != null) {
          List<JourFermeture> lJours = await JourFermetureService().getJours(etaSponso.etaId);
          etaSponso.checkDate(lJours);
          lEtaSponso.add(etaSponso);
        }
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var etabPicture = prefs.getString('etabPicture');
      var bierePicture = prefs.getString('bierePicture');
      var noPicture = prefs.getString('noPicture');
      Navigator.pushReplacementNamed(context, '/resultats', arguments: {
        'lBieres': lBieres,
        'lEtabs': lEtabs,
        'etabPicture': etabPicture,
        'bierePicture': bierePicture,
        'noPicture': noPicture,
        'lIsFavorite': lIsFavorite,
        'lBiereSpon': lBiereSpon,
        'lSponIsFav': lSponIsFav,
        'lEtaSponso': lEtaSponso,
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
