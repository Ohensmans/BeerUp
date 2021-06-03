import 'dart:convert';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EtabService {
  Future<Etablissement> getEtab(String etaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiEtablissements').toString() + etaId;

    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      Etablissement etab = Etablissement.fromJson(jsonDecode(response.body));
      return etab;
    } catch (e) {
      print(e);
      return Etablissement();
    }
  }

  Future<List<Etablissement>> searchEtab(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiSearchEtab').toString() + text;
    Uri uri = Uri.parse(url);
    List<Etablissement> etabs = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        etabs = List<Etablissement>.from(
            list.map((model) => Etablissement.fromJson(model)));
      }
      return etabs;
    } catch (e) {
      print(e);
      return etabs;
    }
  }
}
