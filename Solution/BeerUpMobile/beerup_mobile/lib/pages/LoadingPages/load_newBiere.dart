import 'package:beerup_mobile/models/TypeBiereModel.dart';
import 'package:beerup_mobile/services/CallApi/TypeBiereService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadNewBiere extends StatefulWidget {
  @override
  _LoadNewBiereState createState() => _LoadNewBiereState();
}

class _LoadNewBiereState extends State<LoadNewBiere> {
  Map data = {};
  List<TypeBiere> lTypes;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    lTypes = await TypeBiereService().getTypesBiere();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var noPictureAvailableUrl = prefs.getString('noPicture');

    Navigator.pushReplacementNamed(context, '/newBiere', arguments: {
      'lTypes': lTypes,
      'noPictureAvailableUrl': noPictureAvailableUrl,
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
