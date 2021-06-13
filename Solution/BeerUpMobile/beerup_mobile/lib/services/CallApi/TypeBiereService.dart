import 'dart:convert';
import 'package:beerup_mobile/models/TypeBiereModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeBiereService {
  Future<List<TypeBiere>> getTypesBiere() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiTypesBiere').toString();

    Uri uri = Uri.parse(url);
    List<TypeBiere> lTypes = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        lTypes = List<TypeBiere>.from(
            list.map((model) => TypeBiere.fromJson(model)));
      }
      return lTypes;
    } catch (e) {
      print(e);
      return lTypes;
    }
  }
}
