import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/widgets/itemListBieres.dart';
import 'package:flutter/material.dart';

class ListeBieres extends StatelessWidget {
  ListeBieres(
      {this.lBieres,
      this.noPicture,
      this.bierePicture,
      this.lIsFavorite,
      this.isSuggestion,
      this.lTypesNom});

  final List<Biere> lBieres;
  final String noPicture;
  final String bierePicture;
  final List<bool> lIsFavorite;
  final bool isSuggestion;
  final List<String> lTypesNom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: lBieres.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                  child: ItemListBiere(
                biere: lBieres[index],
                noPicture: noPicture,
                bierePicture: bierePicture,
                isFavorite: lIsFavorite[index],
                isSuggestion: isSuggestion,
                typeService: lTypesNom != null ? lTypesNom[index] : null,
              )),
            );
          }),
    );
  }
}
