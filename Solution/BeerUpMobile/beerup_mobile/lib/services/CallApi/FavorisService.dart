import 'dart:convert';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/FavorisModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavorisService {
  Future<bool> isFavoris(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiLibrairieUser').toString() + bieId;
    bool isFav = false;
    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        isFav = (jsonDecode(response.body));
      }
      return isFav;
    } catch (e) {
      print(e);
      return isFav;
    }
  }

  Future<bool> addFavoris(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String userInfo = prefs.get('userInfo');
    String userId = userInfo.substring(6, 42);
    String url = prefs.get('apiLibrairieUser').toString();
    Favoris favori = Favoris(bieId, userId);
    bool worked = false;
    var favoriJson = jsonEncode(favori.favorisToJson());
    Uri uri = Uri.parse(url);
    try {
      Response response = await post(uri,
          headers: {
            "Authorization": "Bearer $accessToken",
            "content-type": "application/json"
          },
          body: favoriJson);
      if (response.statusCode == 204) {
        worked = true;
      }
      return worked;
    } catch (e) {
      print(e);
      return worked;
    }
  }

  Future<bool> deleteFavoris(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiLibrairieUser').toString() + bieId;
    bool worked = false;
    Uri uri = Uri.parse(url);
    try {
      Response response =
          await delete(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 204) {
        worked = true;
      }
      return worked;
    } catch (e) {
      print(e);
      return worked;
    }
  }

  Future<List<Biere>> getFavoris() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiLibrairieUser').toString();
    Uri uri = Uri.parse(url);
    List<Biere> lBieres = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        lBieres = List<Biere>.from(list.map((model) => Biere.fromJson(model)));
      }
      return lBieres;
    } catch (e) {
      print(e);
      return lBieres;
    }
  }
}
