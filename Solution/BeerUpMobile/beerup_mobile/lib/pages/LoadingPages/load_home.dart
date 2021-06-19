import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadHome extends StatefulWidget {
  @override
  _LoadHomeState createState() => _LoadHomeState();
}

class _LoadHomeState extends State<LoadHome> {
  Biere biere;

  @override
  void initState() {
    super.initState();
    getBiere();
  }

  getBiere() async {
    biere = await BiereService().getBiereSponsorisee(true);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var noPicture = prefs.getString('noPicture');
    var bierePicture = prefs.getString('bierePicture');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'biere': biere,
      'noPicture': noPicture,
      'bierePicture': bierePicture,
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
