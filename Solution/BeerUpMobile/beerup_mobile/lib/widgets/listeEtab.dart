import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:flutter/material.dart';

class ListeEtab extends StatelessWidget {
  ListeEtab({this.lEtab, this.ressourceBaseUrl, this.noPicture});

  final List<Etablissement> lEtab;
  final String ressourceBaseUrl;
  final String noPicture;

  @override
  Widget build(BuildContext context) {
    if (lEtab.isNotEmpty) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: lEtab.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: ListTile(
                    tileColor: lEtab[index].estOuvert
                        ? Colors.lightGreen[700]
                        : Colors.red[700],
                    leading: CircleAvatar(
                      backgroundImage: lEtab[index].etaPhoto != null &&
                              lEtab[index].etaPhoto.isNotEmpty
                          ? NetworkImage(
                              ressourceBaseUrl + lEtab[index].etaPhoto)
                          : NetworkImage(noPicture),
                    ),
                    onTap: () {
                      if (lEtab[index].etaNum != null &&
                          lEtab[index].etaRue != null &&
                          lEtab[index].etaCp != null &&
                          lEtab[index].etaVille != null &&
                          lEtab[index].etaPays != null) {
                        Navigator.pushNamed(context, '/loadEtab',
                            arguments: {'etab': lEtab[index]});
                      }
                    },
                    title: Text(lEtab[index].etaNom),
                    subtitle: lEtab[index].etaNum != null &&
                            lEtab[index].etaRue != null &&
                            lEtab[index].etaCp != null &&
                            lEtab[index].etaVille != null &&
                            lEtab[index].etaPays != null
                        ? Text(lEtab[index].etaNum +
                            ', ' +
                            lEtab[index].etaRue +
                            ' ' +
                            lEtab[index].etaCp +
                            ' ' +
                            lEtab[index].etaVille +
                            ' ' +
                            lEtab[index].etaPays)
                        : Text(''),
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
