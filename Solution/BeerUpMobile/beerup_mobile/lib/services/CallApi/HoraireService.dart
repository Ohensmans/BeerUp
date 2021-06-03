import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beerup_mobile/models/HoraireModel.dart';

class HoraireService {
  Future<List<Horaire>> getHoraires(String etaId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiHoraires').toString() + etaId;

    Uri uri = Uri.parse(url);
    List<Horaire> lHoraire = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        lHoraire =
            List<Horaire>.from(list.map((model) => Horaire.fromJson(model)));
      }
      return lHoraire;
    } catch (e) {
      print(e);
      return lHoraire;
    }
  }
}
