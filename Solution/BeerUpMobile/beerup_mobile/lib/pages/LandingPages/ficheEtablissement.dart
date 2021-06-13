import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/models/HoraireModel.dart';
import 'package:beerup_mobile/models/JourFermetureModel.dart';
import 'package:beerup_mobile/widgets/listeHoraire.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class FicheEtablissement extends StatefulWidget {
  @override
  _FicheEtablissementState createState() => _FicheEtablissementState();
}

class _FicheEtablissementState extends State<FicheEtablissement> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String ressourceBaseUrl = data['ressourceBaseUrl'];
    Etablissement etab = data['etab'];
    List<Horaire> lHoraires = data['lHoraires'];
    List<JourFermeture> lJours = data['lJours'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              etab.etaNom.toUpperCase(),
              style: TextStyle(
                color: Colors.amber[900],
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              etab.nomTypeEta,
              style: TextStyle(
                color: Colors.amber[900],
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            etab.etaPhoto != null && etab.etaPhoto.isNotEmpty
                ? Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                                ressourceBaseUrl + etab.etaPhoto))),
                  )
                : Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/biere6.jpg'))),
                  ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          etab.etaNum + ' ' + etab.etaRue,
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          etab.etaCp + ' ' + etab.etaVille + ' ' + etab.etaPays,
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            etab.etaWeb != null && etab.etaWeb.isNotEmpty
                ? Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.link,
                          color: Colors.white,
                        ),
                        label: Text(etab.etaWeb,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 14,
                            )),
                      ),
                    ],
                  )
                : Container(),
            etab.etaEmail != null && etab.etaEmail.isNotEmpty
                ? Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        label: Text(etab.etaEmail,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 14,
                            )),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loadBieresEtab',
                      arguments: {
                        'etaId': etab.etaId,
                      });
                },
                child: Text("Voir la liste des bières"),
              ),
            ),
            SizedBox(height: 40.0),
            etab.estOuvert
                ? Text(
                    'HORAIRE - Ouvert',
                    style: TextStyle(
                      color: Colors.greenAccent[400],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 2.0,
                    ),
                  )
                : Text(
                    'HORAIRE - Fermé',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 2.0,
                    ),
                  ),
            etab.estJourFermeture
                ? SizedBox(
                    height: 20.0,
                  )
                : Container(),
            etab.estJourFermeture
                ? Text(
                    "Aujourd'hui est un jour de fermeture exceptionnel",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.0,
                    ),
                  )
                : Container(),
            lJours.length > 2 ? SizedBox(height: 20) : Container(),
            lJours.length > 2
                ? Text(
                    "Le prochain jour de fermeture est le : ${lJours[1].jouDate.day}-${lJours[1].jouDate.month}-${lJours[1].jouDate.year}",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.0,
                    ),
                  )
                : Container(),
            SizedBox(height: 20),
            lHoraires.isNotEmpty
                ? ListeHoraire(
                    lHoraires: lHoraires,
                    ressourceBaseUrl: ressourceBaseUrl,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
