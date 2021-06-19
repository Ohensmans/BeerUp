import 'dart:io';
import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:beerup_mobile/services/CallApi/ImageService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadResultatsPhoto extends StatefulWidget {
  @override
  _LoadResultatsPhotoState createState() => _LoadResultatsPhotoState();
}

class _LoadResultatsPhotoState extends State<LoadResultatsPhoto> {
  Map data = {};
  File image;
  List<Biere> lBieres = [];
  List<Etablissement> lEtabs = [];
  List<bool> lIsFavorite = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    image = data['image'];
    if (image != null) {
      load(image);
    } else {
      Navigator.pushReplacementNamed(context, '/recherche');
    }
  }

  load(File image) async {
    lBieres = await ImageService().searchImage(image);

    //erreur dans le chargement => vers recherche
    if (lBieres == null) {
      Navigator.pushReplacementNamed(context, '/recherche');
    }

    for (var i = 0; i < lBieres.length; i++) {
      bool isFav = await FavorisService().isFavoris(lBieres[i].bieId);
      lIsFavorite.add(isFav);
    }

    //aucun résultat
    if (lBieres != null && lBieres.isEmpty) {
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
