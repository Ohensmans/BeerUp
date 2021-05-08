import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Initialization {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String baseUrl = 'http://192.168.179.134:5001/api/';
    String ressourceBaseUrl = 'http://192.168.179.134:5001';

    await prefs.setString('userInfo', '');
    await prefs.setString('apiBiereSponsorisee', baseUrl + 'BiereSponsorisee/');
    await prefs.setString('apiEtablissements', baseUrl + 'Etablissements/');
    await prefs.setString('apiTypesBieres', baseUrl + 'TypesBiere/');
    await prefs.setString('apiAvisMoyen', baseUrl + 'AvisMoyen/');
    await prefs.setString('ressourceBaseUrl', ressourceBaseUrl);
  }
}
