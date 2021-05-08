import 'dart:convert';
import 'package:beerup_mobile/models/BiereModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiereService {
  Future<Biere> getBiereSponsorisee(bool needOne) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url =
        prefs.get('apiBiereSponsorisee').toString() + needOne.toString();

    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      Biere biere = Biere.fromJson(jsonDecode(response.body));
      return biere;
    } catch (e) {
      print(e);
      return Biere();
    }
  }
}
