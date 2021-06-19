import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:flutter/material.dart';

class ItemListBiere extends StatefulWidget {
  const ItemListBiere(
      {Key key,
      this.biere,
      this.noPicture,
      this.bierePicture,
      this.isFavorite,
      this.isSuggestion,
      this.typeService})
      : super(key: key);

  final String noPicture;
  final String bierePicture;
  final Biere biere;
  final bool isFavorite;
  final bool isSuggestion;
  final String typeService;

  @override
  _ItemListBiereState createState() => _ItemListBiereState();
}

class _ItemListBiereState extends State<ItemListBiere> {
  bool isFav;

  void initState() {
    super.initState();
    isFav = widget.isFavorite;
  }

  void deleteFavoris(BuildContext context) async {
    bool deleted = await FavorisService().deleteFavoris(widget.biere.bieId);
    if (deleted) {
      if (widget.isSuggestion) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Bière retirée de vos favoris"),
          backgroundColor: Colors.red,
        ));
        setState(() {
          isFav = false;
        });
      } else {
        Navigator.pushReplacementNamed(context, '/loadFavoris');
      }
    }
  }

  void addFavoris(BuildContext context) async {
    bool added = await FavorisService().addFavoris(widget.biere.bieId);
    if (added) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Bière rajoutée à vos favoris"),
        backgroundColor: Colors.green[700],
      ));
      setState(() {
        isFav = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(widget.biere.biePhoto != null &&
                                widget.biere.biePhoto.isNotEmpty
                            ? widget.bierePicture + widget.biere.biePhoto
                            : widget.noPicture),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Nom : ' + widget.biere.bieNom,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Brasserie : ' + widget.biere.etaNom,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Type : ' + widget.biere.typBieNom,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Note : ' + widget.biere.noteMoyen.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      widget.typeService != null
                          ? Expanded(
                              flex: 1,
                              child: Text(
                                'Service : ' + widget.typeService,
                                style: TextStyle(
                                  color: Colors.amber[900],
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          : Container(),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.grading_sharp),
                              tooltip: 'Fiche bière',
                              onPressed: () {
                                Navigator.pushNamed(context, '/loadBiere',
                                    arguments: {'biere': widget.biere});
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.map),
                              tooltip: 'Où trouver',
                              onPressed: () {
                                Navigator.pushNamed(context, '/loadOuTrouver',
                                    arguments: {'bieId': widget.biere.bieId});
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star),
                              tooltip: 'Suggestions',
                              onPressed: () {
                                Navigator.pushNamed(context, '/loadSuggestions',
                                    arguments: {
                                      'isBiereLinked': 'true',
                                      'bieId': widget.biere.bieId,
                                    });
                              },
                            ),
                            isFav
                                ? IconButton(
                                    icon: Icon(Icons.delete_forever_outlined),
                                    tooltip: 'Supprimer de la liste',
                                    onPressed: () {
                                      deleteFavoris(context);
                                    },
                                  )
                                : IconButton(
                                    icon: Icon(Icons.add_circle_rounded),
                                    tooltip: 'Ajouter à la liste',
                                    onPressed: () {
                                      addFavoris(context);
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
