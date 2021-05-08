import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beerup_mobile/models/TypeBiereModel.dart';

class TypeBiereService {
  Future<TypeBiere> getTypeNom(String typeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiTypesBieres').toString() + typeId;

    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      TypeBiere type = TypeBiere.fromJson(jsonDecode(response.body));
      return type;
    } catch (e) {
      print(e);
      return TypeBiere();
    }
  }
}
