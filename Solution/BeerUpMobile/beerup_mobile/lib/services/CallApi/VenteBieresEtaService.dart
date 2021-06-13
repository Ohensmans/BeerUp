import 'dart:convert';
import 'package:beerup_mobile/models/VenteBiereEtaModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VenteBieresEtaService {
  Future<List<VenteBiereEta>> getVentes(String etaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiVentesBieresEta').toString() + etaId;

    Uri uri = Uri.parse(url);
    List<VenteBiereEta> lVentes = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        lVentes = List<VenteBiereEta>.from(
            list.map((model) => VenteBiereEta.fromJson(model)));
      }
      return lVentes;
    } catch (e) {
      print(e);
      return lVentes;
    }
  }
}
