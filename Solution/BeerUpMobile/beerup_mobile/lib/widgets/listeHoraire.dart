import 'package:beerup_mobile/models/HoraireModel.dart';
import 'package:flutter/material.dart';

class ListeHoraire extends StatelessWidget {
  ListeHoraire({this.lHoraires, this.ressourceBaseUrl});

  final List<Horaire> lHoraires;
  final String ressourceBaseUrl;

  @override
  Widget build(BuildContext context) {
    if (lHoraires.isNotEmpty) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: lHoraires.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.green[700],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          lHoraires[index].horJour.toUpperCase(),
                          style: TextStyle(
                              color: Colors.grey[200],
                              letterSpacing: 1.0,
                              fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Ouverture: ' + lHoraires[index].horDebut,
                          style: TextStyle(
                              color: Colors.grey[200],
                              letterSpacing: 1.0,
                              fontSize: 12.0),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Fermeture: ' + lHoraires[index].horFin,
                          style: TextStyle(
                              color: Colors.grey[200],
                              letterSpacing: 1.0,
                              fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    } else {
      return Container();
    }
  }
}
