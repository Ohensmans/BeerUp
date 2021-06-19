import 'dart:io';
import 'package:beerup_mobile/pages/LandingPages/bieresEtab.dart';
import 'package:beerup_mobile/pages/LandingPages/favoris.dart';
import 'package:beerup_mobile/pages/LandingPages/ficheBiere.dart';
import 'package:beerup_mobile/pages/LandingPages/ficheEtablissement.dart';
import 'package:beerup_mobile/pages/LandingPages/newBiere.dart';
import 'package:beerup_mobile/pages/LandingPages/ouTrouver.dart';
import 'package:beerup_mobile/pages/LandingPages/suggestions.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_ouTrouver.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_biere.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_biereEtab.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_etab.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_favoris.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_home.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_newBiere.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_resultats.dart';
import 'package:beerup_mobile/pages/LandingPages/login.dart';
import 'package:beerup_mobile/pages/LandingPages/notFound.dart';
import 'package:beerup_mobile/pages/LandingPages/resultats.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_resultatsPhoto.dart';
import 'package:beerup_mobile/pages/LoadingPages/load_suggestions.dart';
import 'package:beerup_mobile/services/Initialization.dart';
import 'package:flutter/material.dart';
import 'package:beerup_mobile/pages/LandingPages/home.dart';
import 'package:beerup_mobile/pages/LandingPages/recherche.dart';

void main() async {
  Initialization init = new Initialization();
  await init.initialize();

  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.green[700]),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/load_home': (context) => LoadHome(),
      '/home': (context) => Home(),
      '/recherche': (context) => Recherche(),
      '/loadResultats': (context) => LoadResultats(),
      '/resultats': (context) => Resultats(),
      '/notFound': (context) => NotFound(),
      '/loadEtab': (context) => LoadEtab(),
      '/etab': (context) => FicheEtablissement(),
      '/loadBiere': (context) => LoadBiere(),
      '/biere': (context) => FicheBiere(),
      '/loadFavoris': (context) => LoadFavoris(),
      '/favoris': (context) => FavorisPage(),
      '/loadNewBiere': (context) => LoadNewBiere(),
      '/newBiere': (context) => NewBiere(),
      '/loadSuggestions': (context) => LoadSuggestions(),
      '/suggestions': (context) => Suggestions(),
      '/loadBieresEtab': (context) => LoadBiereEtab(),
      '/bieresEtab': (context) => BieresEtab(),
      '/loadOuTrouver': (context) => LoadOuTrouver(),
      '/ouTrouver': (context) => OuTrouver(),
      '/loadResultatsPhoto': (context) => LoadResultatsPhoto(),
    },
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
