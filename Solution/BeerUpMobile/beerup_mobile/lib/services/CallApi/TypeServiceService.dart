import 'dart:convert';
import 'package:beerup_mobile/models/TypeServiceModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TypeServiceService {
  Future<List<TypeService>> getTypes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiTypesServices').toString();

    Uri uri = Uri.parse(url);
    List<TypeService> lTypes = [];
    try {
      Response response =
          await get(uri, headers: {"Authorization": "Bearer $accessToken"});
      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        lTypes = List<TypeService>.from(
            list.map((model) => TypeService.fromJson(model)));
      }
      return lTypes;
    } catch (e) {
      print(e);
      return lTypes;
    }
  }
}
