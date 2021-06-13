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

  Future<Etablissement> getEtabSponso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiEtabSponsorise').toString();

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

  Future<Etablissement> postEtab(Etablissement etab) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiEtablissements').toString();
    Uri uri = Uri.parse(url);

    var avisJson = jsonEncode(etab.etabToJson());

    try {
      Response response = await post(uri,
          headers: {
            "Authorization": "Bearer $accessToken",
            "content-type": "application/json"
          },
          body: avisJson);
      if (response.statusCode == 201) {
        return Etablissement.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Etablissement>> getEtabDistance(
      double distance, double lattitude, double longitude, String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');

    final queryParams = {
      'distance': distance.toString(),
      'lattitude': lattitude.toString(),
      'longitude': longitude.toString(),
      'bieId': bieId
    };

    Uri uri =
        Uri.http('192.168.179.134:5001', '/api/EtabDistance/', queryParams);
    List<Etablissement> etabs = [];
    try {
      Response response = await get(uri, headers: {
        "Authorization": "Bearer $accessToken",
        "content-type": "application/json",
      });
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
