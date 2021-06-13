import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:beerup_mobile/services/CallApi/SuggestionsService.dart';
import 'package:beerup_mobile/widgets/listeBieres.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  Map data = {};

  getSugTopMois() async {
    List<Biere> lSug = await SuggestionsServices().getSuggestionsMois();
    loadFavorites(lSug);
  }

  getSugFav() async {
    List<Biere> lSug =
        await SuggestionsServices().getSuggestionsBieresFavorites();
    loadFavorites(lSug);
  }

  getSugSurprise() async {
    List<Biere> lSug = await SuggestionsServices().getSuggestionsSurprises();
    loadFavorites(lSug);
  }

  loadFavorites(List<Biere> lSug) async {
    if (lSug != null && lSug.isNotEmpty) {
      changeState(lSug);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("Aucune suggestion n'a pu être trouvée selon vos favoris"),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<List<bool>> getListFav(List<Biere> lSug) async {
    List<bool> lIsFav = [];
    for (var i = 0; i < lSug.length; i++) {
      bool isFav = await FavorisService().isFavoris(lSug[i].bieId);
      lIsFav.add(isFav);
    }
    return lIsFav;
  }

  loadSponsor() async {}

  changeState(List<Biere> lSug) async {
    List<bool> lIsFavorite = await getListFav(lSug);

    Biere biereSpon = await BiereService().getBiereSponsorisee(false);
    List<Biere> lBiereSpon = [];
    List<bool> lSponIsFav = [];
    if (biereSpon != null) {
      lBiereSpon.add(biereSpon);
      bool isFav = await FavorisService().isFavoris(biereSpon.bieId);
      lSponIsFav.add(isFav);
    }

    setState(() {
      data['lSuggestions'] = lSug;
      data['hasContent'] = true;
      data['lIsFavorite'] = lIsFavorite;
      data['lBiereSpon'] = lBiereSpon;
      data['lSponIsFav'] = lSponIsFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String ressourceBaseUrl = data['ressourceBaseUrl'];
    List<Biere> lSuggestions = data['lSuggestions'];
    List<bool> lIsFavorite = data['lIsFavorite'];
    bool hasContent = data['hasContent'];
    List<Biere> lBiereSpon = data['lBiereSpon'];
    List<bool> lSponIsFav = data['lSponIsFav'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Container(
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
                            image: AssetImage('assets/images/biere9.jpg'))),
                  ),
                  SizedBox(height: 40),
                  lBiereSpon.isNotEmpty
                      ? Text(
                          'Annonce Sponsorisée:',
                          style: TextStyle(
                            color: Colors.amber[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                          ),
                        )
                      : Container(),
                  lBiereSpon.isNotEmpty ? SizedBox(height: 20) : Container(),
                  lBiereSpon.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          child: ListeBieres(
                            lBieres: lBiereSpon,
                            ressourceBaseUrl: ressourceBaseUrl,
                            lIsFavorite: lSponIsFav,
                            isSuggestion: true,
                          ),
                        )
                      : Container(),
                  lBiereSpon.isNotEmpty ? SizedBox(height: 20) : Container(),
                  Text(
                    'Nos Suggestions:',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 14.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  !hasContent
                      ? Center(
                          child: Text('Pas de résultat trouvé !',
                              style: TextStyle(
                                color: Colors.red,
                              )),
                        )
                      : Container(
                          padding: const EdgeInsets.all(8.0),
                          child: ListeBieres(
                            lBieres: lSuggestions,
                            ressourceBaseUrl: ressourceBaseUrl,
                            lIsFavorite: lIsFavorite,
                            isSuggestion: true,
                          ),
                        ),
                  SizedBox(height: 40),
                  Text(
                    "Critères de suggestions : ",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 14.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          getSugTopMois();
                        },
                        label: Text('top du mois'),
                        icon: Icon(
                          Icons.emoji_events,
                          color: Colors.grey[200],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          getSugFav();
                        },
                        label: Text('Favoris'),
                        icon: Icon(
                          Icons.collections_bookmark_outlined,
                          color: Colors.grey[200],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          getSugSurprise();
                        },
                        label: Text('Surprise!'),
                        icon: Icon(
                          Icons.local_fire_department_sharp,
                          color: Colors.grey[200],
                        ),
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
