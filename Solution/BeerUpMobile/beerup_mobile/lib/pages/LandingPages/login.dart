import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beerup_mobile/services/Authenticate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void isLogged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userInfo = prefs.getString('userInfo');

    if (userInfo == null || userInfo == '') {
      Authenticate auth = new Authenticate();
      await auth.authenticate();
      userInfo = prefs.getString('userInfo');
    }

    if (userInfo != null) {
      Navigator.pushReplacementNamed(context, '/load_home');
    } else {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  void initState() {
    super.initState();
    isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
