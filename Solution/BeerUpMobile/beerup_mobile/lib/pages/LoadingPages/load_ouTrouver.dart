import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:beerup_mobile/services/LocalizationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadOuTrouver extends StatefulWidget {
  @override
  _LoadOuTrouverState createState() => _LoadOuTrouverState();
}

class _LoadOuTrouverState extends State<LoadOuTrouver> {
  Map data = {};
  Etablissement etab;
  double startLatitude;
  double startLongitude;
  final double distance = 20;
  final double lattitudeTest = 50.850340;
  final double longitudeTest = 4.351710;
  List<Etablissement> lEtabs = [];
  List<Etablissement> lEtabSponso = [];
  String bieId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    etab = data['etab'];
    bieId = data['bieId'];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ressourceBaseUrl = prefs.getString('ressourceBaseUrl');
    var noPicture = prefs.getString('noPicture');

    if (etab != null) {
      lEtabs = [];
      startLatitude = double.parse(etab.etaCoordLat);
      startLongitude = double.parse(etab.etaCoordLong);
      lEtabs.add(etab);
      Navigator.pushReplacementNamed(context, '/ouTrouver', arguments: {
        'lEtabs': lEtabs,
        'startLatitude': startLatitude,
        'startLongitude': startLongitude,
        'lEtabSponso': lEtabSponso,
        'ressourceBaseUrl': ressourceBaseUrl,
        'noPicture': noPicture,
        'bieId': bieId,
      });
    } else if (bieId != null && bieId.isNotEmpty) {
      // ignore: unused_local_variable
      Position startPosition = await LocalizationService().determinePosition();
      // if (startPosition != null) {
      //   startLatitude = startPosition.latitude;
      //   startLongitude = startPosition.longitude;
      // } else {
      //   startLatitude = lattitudeTest;
      //   startLongitude = longitudeTest;
      // }
      startLatitude = lattitudeTest;
      startLongitude = longitudeTest;

      lEtabs = await EtabService()
          .getEtabDistance(distance, startLatitude, startLongitude, bieId);
      Etablissement etabl = await EtabService().getEtabSponso();
      lEtabSponso.add(etabl);

      Navigator.pushReplacementNamed(context, '/ouTrouver', arguments: {
        'lEtabs': lEtabs,
        'startLatitude': startLatitude,
        'startLongitude': startLongitude,
        'lEtabSponso': lEtabSponso,
        'ressourceBaseUrl': ressourceBaseUrl,
        'noPicture': noPicture,
        'bieId': bieId,
      });
    } else {
      Navigator.pushReplacementNamed(context, '/load_home');
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
