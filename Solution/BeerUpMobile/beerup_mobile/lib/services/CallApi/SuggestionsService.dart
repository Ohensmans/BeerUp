import 'dart:convert';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuggestionsServices {
  Future<List<Biere>> getSuggestionsBiere(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiSuggestionBiere').toString() + bieId;
    Uri uri = Uri.parse(url);
    List<Biere> bieres = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        bieres = List<Biere>.from(list.map((model) => Biere.fromJson(model)));
      }
      return bieres;
    } catch (e) {
      print(e);
      return bieres;
    }
  }

  Future<List<Biere>> getSuggestionsBieresFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiSuggestionsBieresFavorites').toString();
    Uri uri = Uri.parse(url);
    List<Biere> bieres = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        bieres = List<Biere>.from(list.map((model) => Biere.fromJson(model)));
      }
      return bieres;
    } catch (e) {
      print(e);
      return bieres;
    }
  }

  Future<List<Biere>> getSuggestionsMois() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiSuggestionsMois').toString();
    Uri uri = Uri.parse(url);
    List<Biere> bieres = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        bieres = List<Biere>.from(list.map((model) => Biere.fromJson(model)));
      }
      return bieres;
    } catch (e) {
      print(e);
      return bieres;
    }
  }

  Future<List<Biere>> getSuggestionsSurprises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiSuggestionsSurprise').toString();
    Uri uri = Uri.parse(url);
    List<Biere> bieres = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        bieres = List<Biere>.from(list.map((model) => Biere.fromJson(model)));
      }
      return bieres;
    } catch (e) {
      print(e);
      return bieres;
    }
  }
}
