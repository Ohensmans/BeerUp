import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/AvisService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadBiere extends StatefulWidget {
  @override
  _LoadBiereState createState() => _LoadBiereState();
}

class _LoadBiereState extends State<LoadBiere> {
  Map data = {};
  Biere biere;
  Avis avisMoyen;
  Avis avisUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    biere = data['biere'];
    if (biere != null) {
      load();
    } else {
      Navigator.pushReplacementNamed(context, '/load_home');
    }
  }

  load() async {
    avisMoyen = await AvisService().getAvisMoyen(biere.bieId);
    avisUser = await AvisService().getAvisUser(biere.bieId);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ressourceBaseUrl = prefs.getString('ressourceBaseUrl');

    Navigator.pushReplacementNamed(context, '/biere', arguments: {
      'biere': biere,
      'ressourceBaseUrl': ressourceBaseUrl,
      'avisMoyen': avisMoyen,
      'avisUser': avisUser,
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
