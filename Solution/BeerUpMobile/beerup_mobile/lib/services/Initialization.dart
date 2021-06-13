import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Initialization {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String baseUrl = 'http://192.168.179.134:5001/api/';
    String ressourceBaseUrl = 'http://192.168.179.134:5001';
    String identityUrl = 'http://192.168.179.134:5000';
    //String baseUrl = 'http://localhost:5001/api/';
    //String ressourceBaseUrl = 'http://localhost:5001';
    //String identityUrl = 'http://localhost:5000';
    String noPicture =
        ressourceBaseUrl + '/resources/images/no_image_available.png';

    await prefs.setString('userInfo', '');
    await prefs.setString('noPicture', noPicture);
    await prefs.setString(
        'apiEtabDistance', '192.168.179.134:5001/api/' + 'EtabDistance/');
    await prefs.setString('apiEtabSponsorise', baseUrl + 'EtabsSponsorises/');
    await prefs.setString(
        'apiBiereMobileVenduesEtab', baseUrl + 'BiereMobileVenduesEtab/');
    await prefs.setString('apiVentesBieresEta', baseUrl + 'VentesBieresEta/');
    await prefs.setString('apiTypesServices', baseUrl + 'TypesServices/');
    await prefs.setString('apiSuggestionBiere', baseUrl + 'SuggestionsBiere/');
    await prefs.setString('apiSuggestionsBieresFavorites',
        baseUrl + 'SuggestionsBieresFavorites/');
    await prefs.setString('apiSuggestionsMois', baseUrl + 'SuggestionsMois/');
    await prefs.setString(
        'apiSuggestionsSurprise', baseUrl + 'SuggestionsSurprise/');
    await prefs.setString('apiTypesBiere', baseUrl + 'TypesBiere/');
    await prefs.setString('apiImageUpload', baseUrl + 'ImageBiere/');
    await prefs.setString('apiBiereSponsorisee', baseUrl + 'BiereSponsorisee/');
    await prefs.setString('apiEtablissements', baseUrl + 'Etablissements/');
    await prefs.setString('apiTypesBieres', baseUrl + 'TypesBiere/');
    await prefs.setString('apiAvisMoyen', baseUrl + 'AvisMoyen/');
    await prefs.setString('apiSearchBiere', baseUrl + 'SearchBieres/');
    await prefs.setString('apiSearchEtab', baseUrl + 'SearchEtabs/');
    await prefs.setString('apiHoraires', baseUrl + 'Horaires/');
    await prefs.setString('apiJoursFermeture', baseUrl + 'JoursFermeture/');
    await prefs.setString('apiAvisUser', baseUrl + 'AvisUser/');
    await prefs.setString('apiLibrairieUser', baseUrl + 'LibrairieUser/');
    await prefs.setString('ressourceBaseUrl', ressourceBaseUrl);
    await prefs.setString('identityUrl', identityUrl);
  }
}
