import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beerup_mobile/models/AvisModel.dart';

class AvisService {
  Future<Avis> getAvisMoyen(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiAvisMoyen').toString() + bieId;
    Avis avis = Avis();
    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        avis = Avis.fromJson(jsonDecode(response.body));
      }
      return avis;
    } catch (e) {
      print(e);
      return avis;
    }
  }

  Future<Avis> getAvisUser(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiAvisUser').toString() + bieId;
    Avis avis = Avis();
    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        avis = Avis.fromJson(jsonDecode(response.body));
      }
      return avis;
    } catch (e) {
      print(e);
      return avis;
    }
  }

  Future<bool> postAvisUser(Avis avis) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiAvisUser').toString();
    Uri uri = Uri.parse(url);
    try {
      Response response = await post(uri,
          headers: {"Authorization": "Bearer $accessToken"}, body: avis);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
