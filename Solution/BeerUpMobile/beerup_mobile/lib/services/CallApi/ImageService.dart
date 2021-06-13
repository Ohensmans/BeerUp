import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ImageService {
  Future<String> postImage(File imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.get('accessToken');
    String url = prefs.get('apiImageUpload').toString();
    Uri uri = Uri.parse(url);

    var stream = new http.ByteStream(imageFile.openRead());
    stream.cast();
    var length = await imageFile.length();

    Map<String, String> headers = ({"Authorization": "Bearer $accessToken"});

    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    var multipartFile = new http.MultipartFile(
      'file',
      stream,
      length,
      filename: basename(imageFile.path),
    );
    //contentType: new MediaType('image', 'png'));
    request.files.add(multipartFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value) {
          return (value);
        });
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
