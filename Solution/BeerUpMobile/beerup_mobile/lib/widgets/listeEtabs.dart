import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/widgets/itemListEtabs.dart';
import 'package:flutter/material.dart';

class ListeEtabs extends StatelessWidget {
  const ListeEtabs(
      {Key key, this.lEtabs, this.ressourceBaseUrl, this.noPictureUrl})
      : super(key: key);

  final List<Etablissement> lEtabs;
  final String ressourceBaseUrl;
  final String noPictureUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: lEtabs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ItemListEtabs(
                  etab: lEtabs[index],
                  ressourceBaseUrl: ressourceBaseUrl,
                  noPictureUrl: noPictureUrl,
                ),
              ),
            );
          }),
    );
  }
}
