import 'dart:convert';

import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BieresVenduesEtabService {
  Future<List<Biere>> getBieres(String etaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiBiereMobileVenduesEtab').toString() + etaId;
    List<Biere> lBieres = [];
    Uri uri = Uri.parse(url);
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
