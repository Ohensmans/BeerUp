import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/models/TypeServiceModel.dart';
import 'package:beerup_mobile/models/VenteBiereEtaModel.dart';
import 'package:beerup_mobile/services/CallApi/BieresVenduesEtabService.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:beerup_mobile/services/CallApi/TypeServiceService.dart';
import 'package:beerup_mobile/services/CallApi/VenteBieresEtaService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadBiereEtab extends StatefulWidget {
  @override
  _LoadBiereEtabState createState() => _LoadBiereEtabState();
}

class _LoadBiereEtabState extends State<LoadBiereEtab> {
  Map data = {};
  List<Biere> lBieres;
  List<VenteBiereEta> lVentes;
  List<TypeService> lTypes;
  List<String> lTypesNom = [];
  List<bool> lIsFavorite = [];
  String etaId;
  Etablissement etab;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    etaId = data['etaId'];
    if (etaId != null) {
      load();
    } else {
      Navigator.pushReplacementNamed(context, '/load_home');
    }
  }

  load() async {
    lBieres = await BieresVenduesEtabService().getBieres(etaId);
    lVentes = await VenteBieresEtaService().getVentes(etaId);
    lTypes = await TypeServiceService().getTypes();
    etab = await EtabService().getEtab(etaId);

    for (var i = 0; i < lBieres.length; i++) {
      bool isFav = await FavorisService().isFavoris(lBieres[i].bieId);
      lIsFavorite.add(isFav);
    }

    lBieres.forEach((elem) {
      String typeId = lVentes
          .firstWhere((element) => element.bieId == elem.bieId)
          .typServId;
      String typeNom =
          lTypes.firstWhere((ele) => ele.typServId == typeId).typSerLibelle;
      lTypesNom.add(typeNom);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var noPicture = prefs.getString('noPicture');
    var bierePicture = prefs.getString('bierePicture');

    Navigator.pushReplacementNamed(context, '/bieresEtab', arguments: {
      'lBieres': lBieres,
      'lTypesNom': lTypesNom,
      'lIsFavorite': lIsFavorite,
      'noPicture': noPicture,
      'bierePicture': bierePicture,
      'etab': etab,
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
