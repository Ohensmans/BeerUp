import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/widgets/listeBieres.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class BieresEtab extends StatefulWidget {
  const BieresEtab({Key key}) : super(key: key);

  @override
  _BieresEtabState createState() => _BieresEtabState();
}

class _BieresEtabState extends State<BieresEtab> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data != null && data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments;
    List<Biere> lBieres = data['lBieres'];
    List<String> lTypesNom = data['lTypesNom'];
    String noPicture = data['noPicture'];
    String bierePicture = data['bierePicture'];
    List<bool> lIsFavorite = data['lIsFavorite'];
    Etablissement etab = data['etab'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/biere10.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    etab.etaNom.toUpperCase(),
                    style: TextStyle(
                      color: Colors.amber[900],
                      fontSize: 16.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  lBieres == null || lBieres.length == 0
                      ? Center(
                          child: Text('Pas de résultat trouvé !',
                              style: TextStyle(
                                color: Colors.red,
                              )),
                        )
                      : Text(
                          "Bières servies par l'établissement :",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListeBieres(
                      lBieres: lBieres,
                      noPicture: noPicture,
                      bierePicture: bierePicture,
                      lIsFavorite: lIsFavorite,
                      isSuggestion: true,
                      lTypesNom: lTypesNom,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
