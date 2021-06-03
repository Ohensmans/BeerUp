import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:flutter/material.dart';

class ListeBiere extends StatelessWidget {
  ListeBiere({this.lBieres, this.ressourceBaseUrl});

  final List<Biere> lBieres;
  final String ressourceBaseUrl;

  @override
  Widget build(BuildContext context) {
    if (lBieres.isNotEmpty) {
      return Container(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: lBieres.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          ressourceBaseUrl + lBieres[index].biePhoto),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/loadBiere',
                          arguments: {'biere': lBieres[index]});
                    },
                    title: Text(
                      lBieres[index].bieNom + ' - ' + lBieres[index].etaNom,
                    ),
                    subtitle: Text(
                      lBieres[index].noteMoyen > 0
                          ? 'Type: ' +
                              lBieres[index].typBieNom +
                              ' - Note: ' +
                              lBieres[index].noteMoyen.toStringAsFixed(1) +
                              '/5'
                          : 'Type: ' +
                              lBieres[index].typBieNom +
                              ' - Note: ?/5',
                    ),
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
