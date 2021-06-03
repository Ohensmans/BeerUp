import 'dart:convert';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiereService {
  Future<Biere> getBiereSponsorisee(bool needOne) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    Biere biere;
    String url =
        prefs.get('apiBiereSponsorisee').toString() + needOne.toString();

    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        biere = Biere.fromJson(jsonDecode(response.body));
      }
      return biere;
    } catch (e) {
      print(e);
      return Biere();
    }
  }

  Future<List<Biere>> searchBiere(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiSearchBiere').toString() + text;
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
