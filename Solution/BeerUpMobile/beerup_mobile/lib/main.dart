import 'dart:io';
import 'package:beerup_mobile/pages/Loading%20pages/load_home.dart';
import 'package:beerup_mobile/pages/login.dart';
import 'package:beerup_mobile/services/Initialization.dart';
import 'package:flutter/material.dart';
import 'package:beerup_mobile/pages/home.dart';

void main() async {
  Initialization init = new Initialization();
  await init.initialize();

  HttpOverrides.global = new MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/load_home': (context) => LoadHome(),
      '/home': (context) => Home(),
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
