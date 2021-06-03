import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/widgets/listeBiere.dart';
import 'package:beerup_mobile/widgets/listeEtab.dart';
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

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: Container(
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
                SizedBox(height: 40.0),
                Text(
                  'RESULTATS POUR LES BIERES',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 12.0,
                    letterSpacing: 2.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ListeBiere(
                    lBieres: lBieres,
                    ressourceBaseUrl: ressourceBaseUrl,
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  'RESULTATS POUR LES ETABLISSEMENTS',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 12.0,
                    letterSpacing: 2.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: ListeEtab(
                    lEtab: lEtabs,
                    ressourceBaseUrl: ressourceBaseUrl,
                    noPicture: noPicture,
                  ),
                ),
                SizedBox(height: 40),
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
                      onPressed: () {},
                      child: Text("Ajouter une bière à l'application"),
                    ),
                  ),
              ]),
        ),
      ),
    );
  }
}
