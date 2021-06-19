import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:beerup_mobile/widgets/avisChart.dart';
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

  switchFav(Map mapData) async {
    if (data.isNotEmpty) {
      bool isFavoris = mapData['isFavoris'];
      bool worked = false;
      if (isFavoris) {
        worked = await FavorisService().deleteFavoris(mapData['biere'].bieId);
      } else {
        worked = await FavorisService().addFavoris((mapData['biere'].bieId));
      }

      if (worked) {
        mapData['isFavoris'] = !isFavoris;
        setState(() {
          data = mapData;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    data = data != null && data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments;
    String noPicture = data['noPicture'];
    String bierePicture = data['bierePicture'];
    Biere biere = data['biere'];
    Avis avisMoyen = data['avisMoyen'];
    Avis avisUser = data['avisUser'];
    bool isFavoris = data['isFavoris'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20),
              Text(
                biere.bieNom.toUpperCase(),
                style: TextStyle(
                  color: Colors.amber[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                'BRASSEUR : ' + biere.etaNom,
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
                          color: Colors.amber[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 2.0),
                    )
                  : Container(),
              biere.bieDesc != null && biere.bieDesc.isNotEmpty
                  ? Text(
                      biere.bieDesc,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14,
                      ),
                    )
                  : Container(),
              biere.bieDesc != null && biere.bieDesc.isNotEmpty
                  ? SizedBox(height: 20)
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(biere.biePhoto != null &&
                                  biere.biePhoto.isNotEmpty
                              ? bierePicture + biere.biePhoto
                              : noPicture),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BRASSERIE : ' + biere.etaNom,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'TYPE : ' + biere.typBieNom,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'VOTRE AVIS',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AvisForm(
                biere: biere,
                avisUser: avisUser,
              ),
              SizedBox(
                height: 20,
              ),
              AvisChart(
                avisMoyen: avisMoyen,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.map,
                          color: Colors.grey[200],
                        ),
                        label: Text('Où en trouver ?'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/loadOuTrouver',
                              arguments: {'bieId': biere.bieId});
                        },
                      ),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.star,
                          color: Colors.grey[200],
                        ),
                        label: Text('Suggestion'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/loadSuggestions',
                              arguments: {
                                'isBiereLinked': 'true',
                                'bieId': biere.bieId,
                              });
                        },
                      ),
                    ],
                  ),
                  isFavoris
                      ? ElevatedButton.icon(
                          icon: Icon(
                            Icons.collections_bookmark_outlined,
                            color: Colors.grey[200],
                          ),
                          label: Text('Retirer des favoris'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.red[900]),
                          ),
                          onPressed: () {
                            switchFav(data);
                          },
                        )
                      : ElevatedButton.icon(
                          icon: Icon(
                            Icons.collections_bookmark_outlined,
                            color: Colors.grey[200],
                          ),
                          label: Text('Ajouter aux favoris'),
                          onPressed: () {
                            switchFav(data);
                          },
                        ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
