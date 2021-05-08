import 'package:beerup_mobile/models/AvisMoyenModel.dart';
import 'package:beerup_mobile/models/BiereModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/models/TypeBiereModel.dart';
import 'package:beerup_mobile/services/CallApi/AvisMoyenService.dart';
import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:beerup_mobile/services/CallApi/TypeBiereService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadHome extends StatefulWidget {
  @override
  _LoadHomeState createState() => _LoadHomeState();
}

class _LoadHomeState extends State<LoadHome> {
  Biere biere;
  Etablissement etab;
  TypeBiere type;
  AvisMoyen avis;

  @override
  void initState() {
    super.initState();
    getBiere();
  }

  getBiere() async {
    biere = await BiereService().getBiereSponsorisee(true);

    if (biere.etaId != null) {
      etab = await EtabService().getEtab(biere.etaId);
    } else {
      etab = new Etablissement();
    }

    if (biere.typBieId != null) {
      type = await TypeBiereService().getTypeNom(biere.typBieId);
    } else {
      type = new TypeBiere();
    }

    if (biere.bieId != null) {
      avis = await AvisMoyenService().getAvisMoyen(biere.bieId);
    } else {
      avis = new AvisMoyen();
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ressourceBaseUrl = prefs.getString('ressourceBaseUrl');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'biere': biere,
      'ressourceBaseUrl': ressourceBaseUrl,
      'etab': etab,
      'typeBiere': type,
      'avisMoyen': avis
    });
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
