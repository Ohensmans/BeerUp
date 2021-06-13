import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadFavoris extends StatefulWidget {
  @override
  _LoadFavorisState createState() => _LoadFavorisState();
}

class _LoadFavorisState extends State<LoadFavoris> {
  Map data = {};
  List<Biere> lBieres = [];
  List<bool> lIsFavorite = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    lBieres = await FavorisService().getFavoris();
    if (lBieres != null && lBieres.isNotEmpty) {
      lBieres.forEach((element) {
        lIsFavorite.add(true);
      });
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ressourceBaseUrl = prefs.getString('ressourceBaseUrl');

    Navigator.pushReplacementNamed(context, '/favoris', arguments: {
      'lBieres': lBieres,
      'lIsFavorite': lIsFavorite,
      'ressourceBaseUrl': ressourceBaseUrl,
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
