import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/widgets/avisForm.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class FicheBiere extends StatefulWidget {
  @override
  _FicheBiereState createState() => _FicheBiereState();
}

class _FicheBiereState extends State<FicheBiere> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String ressourceBaseUrl = data['ressourceBaseUrl'];
    Biere biere = data['biere'];
    Avis avisMoyen = data['avisMoyen'];
    Avis avisUser = data['avisUser'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: Column(children: [
            Text(
              biere.bieNom.toUpperCase() + ' - ' + biere.etaNom,
              style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            biere.bieDesc != null && biere.bieDesc.isNotEmpty
                ? Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 2.0),
                  )
                : Container(),
            biere.bieDesc != null && biere.bieDesc.isNotEmpty
                ? SizedBox(
                    height: 20,
                  )
                : Container(),
            biere.bieDesc != null && biere.bieDesc.isNotEmpty
                ? Text(
                    biere.bieDesc,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  )
                : Container(),
            biere.bieDesc != null && biere.bieDesc.isNotEmpty
                ? SizedBox(height: 20)
                : Container(),
            Text('TYPE : ' + biere.typBieNom),
            SizedBox(height: 20),
            Text(
              'VOTRE AVIS :',
              style: TextStyle(
                color: Colors.grey[200],
                fontSize: 16,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20),
            AvisForm(
              biere: biere,
              ressourceBaseUrl: ressourceBaseUrl,
              avisUser: avisUser,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Trouver la bière'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Ajouter à mes favoris'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Suggestion'),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
