import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beerup_mobile/models/AvisMoyenModel.dart';

class AvisMoyenService {
  Future<AvisMoyen> getAvisMoyen(String bieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiAvisMoyen').toString() + bieId;

    Uri uri = Uri.parse(url);
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      AvisMoyen avis = AvisMoyen.fromJson(jsonDecode(response.body));
      return avis;
    } catch (e) {
      print(e);
      return AvisMoyen();
    }
  }
}
