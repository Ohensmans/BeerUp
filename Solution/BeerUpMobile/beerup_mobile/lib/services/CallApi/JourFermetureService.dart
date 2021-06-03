import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beerup_mobile/models/JourFermetureModel.dart';

class JourFermetureService {
  Future<List<JourFermeture>> getJours(String etaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiJoursFermeture').toString() + etaId;

    Uri uri = Uri.parse(url);
    List<JourFermeture> lJours = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        lJours = List<JourFermeture>.from(
            list.map((model) => JourFermeture.fromJson(model)));
      }
      return lJours;
    } catch (e) {
      print(e);
      return lJours;
    }
  }
}
