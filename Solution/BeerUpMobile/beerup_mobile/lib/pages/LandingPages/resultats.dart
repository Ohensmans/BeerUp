import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/widgets/listeBieres.dart';
import 'package:beerup_mobile/widgets/listeEtabs.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class Resultats extends StatefulWidget {
  @override
  _ResultatsState createState() => _ResultatsState();
}

class _ResultatsState extends State<Resultats> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    List<Biere> lBieres = data['lBieres'];
    List<Etablissement> lEtabs = data['lEtabs'];
    String ressourceBaseUrl = data['ressourceBaseUrl'];
    String noPicture = data['noPicture'];
    List<bool> lIsFavorite = data['lIsFavorite'];
    List<Biere> lBiereSpon = data['lBiereSpon'];
    List<bool> lSponIsFav = data['lSponIsFav'];
    List<Etablissement> lEtaSponso = data['lEtaSponso'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: Container(
        child: SingleChildScrollView(
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
                            image: AssetImage('assets/images/hops.jpg'))),
                  ),
                  SizedBox(height: 40),
                  lBiereSpon.isNotEmpty
                      ? Text(
                          'Annonce Sponsorisée:',
                          style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                          ),
                        )
                      : Container(),
                  lBiereSpon.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          child: ListeBieres(
                            lBieres: lBiereSpon,
                            ressourceBaseUrl: ressourceBaseUrl,
                            lIsFavorite: lSponIsFav,
                            isSuggestion: true,
                          ),
                        )
                      : Container(),
                  lBieres.isNotEmpty ? SizedBox(height: 20.0) : Container(),
                  lBieres.isNotEmpty
                      ? Text(
                          'RESULTATS POUR LES BIERES',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                          ),
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListeBieres(
                      lBieres: lBieres,
                      ressourceBaseUrl: ressourceBaseUrl,
                      lIsFavorite: lIsFavorite,
                      isSuggestion: true,
                    ),
                  ),
                  lEtabs.isNotEmpty ? SizedBox(height: 40.0) : Container(),
                  lEtaSponso.isNotEmpty
                      ? Text(
                          'Annonce Sponsorisée:',
                          style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                          ),
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListeEtabs(
                      lEtabs: lEtaSponso,
                      ressourceBaseUrl: ressourceBaseUrl,
                      noPictureUrl: noPicture,
                    ),
                  ),
                  lEtaSponso.isNotEmpty ? SizedBox(height: 20.0) : Container(),
                  lEtabs.isNotEmpty
                      ? Text(
                          'RESULTATS POUR LES ETABLISSEMENTS',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 12.0,
                            letterSpacing: 2.0,
                          ),
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ListeEtabs(
                      lEtabs: lEtabs,
                      ressourceBaseUrl: ressourceBaseUrl,
                      noPictureUrl: noPicture,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/recherche');
                      },
                      child: Text('Affiner la recherche'),
                    ),
                  ),
                  SizedBox(height: 10),
                  if (lBieres.length < 10)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/loadNewBiere');
                        },
                        child: Text("Ajouter une bière à l'application"),
                      ),
                    ),
                ]),
          ),
        ),
      ),
    );
  }
}
