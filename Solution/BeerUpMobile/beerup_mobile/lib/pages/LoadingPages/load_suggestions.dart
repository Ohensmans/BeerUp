import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/FavorisService.dart';
import 'package:beerup_mobile/services/CallApi/SuggestionsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadSuggestions extends StatefulWidget {
  const LoadSuggestions({Key key}) : super(key: key);

  @override
  _LoadSuggestionsState createState() => _LoadSuggestionsState();
}

class _LoadSuggestionsState extends State<LoadSuggestions> {
  Map data = {};
  bool isBiereLinked;
  bool hasContent = false;
  List<Biere> lSuggestions = [];
  Biere biereSpon;
  List<bool> lIsFavorite = [];
  String bieId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    isBiereLinked = data['isBiereLinked'] == "true";
    bieId = data['bieId'];

    if (isBiereLinked != null) {
      if (isBiereLinked) {
        if (bieId != null && bieId.isNotEmpty) {
          loadSugBiere(bieId);
        } else {
          loadSug();
        }
      } else {
        loadSug();
      }
    } else {
      Navigator.pushReplacementNamed(context, '/load_home');
    }
  }

  loadSugBiere(String bieId) async {
    lSuggestions = await SuggestionsServices().getSuggestionsBiere(bieId);
    launchLandingPage();
  }

  loadSug() async {
    lSuggestions = await SuggestionsServices().getSuggestionsMois();
    launchLandingPage();
  }

  launchLandingPage() async {
    //erreur dans le chargement => vers home page
    if (lSuggestions == null) {
      Navigator.pushReplacementNamed(context, '/load_home');
    }

    biereSpon = await BiereService().getBiereSponsorisee(false);
    List<Biere> lBiereSpon = [];
    List<bool> lSponIsFav = [];
    if (biereSpon != null) {
      lBiereSpon.add(biereSpon);
      bool isFav = await FavorisService().isFavoris(biereSpon.bieId);
      lSponIsFav.add(isFav);
    }

    for (var i = 0; i < lSuggestions.length; i++) {
      bool isFav = await FavorisService().isFavoris(lSuggestions[i].bieId);
      lIsFavorite.add(isFav);
    }
    hasContent = lSuggestions.isNotEmpty;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ressourceBaseUrl = prefs.getString('ressourceBaseUrl');
    Navigator.pushReplacementNamed(context, '/suggestions', arguments: {
      'lSuggestions': lSuggestions,
      'lIsFavorite': lIsFavorite,
      'ressourceBaseUrl': ressourceBaseUrl,
      'hasContent': hasContent,
      'lBiereSpon': lBiereSpon,
      'lSponIsFav': lSponIsFav,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
