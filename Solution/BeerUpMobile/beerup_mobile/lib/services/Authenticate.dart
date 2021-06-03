import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate {
  Credential credential;
  UserInfo userInfo;
  TokenResponse tokenResponse;
  Uri logoutUri;

  Future<void> authenticate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uri = Uri.parse(prefs.getString('identityUrl'));

    var clientId = "BeerUpMobile";
    var scopes = ["openid", "profile", "ApiBeerUp.all"];

    // create the client
    var issuer = await Issuer.discover(uri);
    var client = new Client(issuer, clientId);

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      try {
        await launch(url, forceWebView: true);
      } catch (e) {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = new Authenticator(client,
        scopes: scopes, port: 4000, urlLancher: urlLauncher);

    // starts the authentication
    credential = await authenticator.authorize();

    // close the webview when finished
    closeWebView();

    tokenResponse = await credential.getTokenResponse();
    userInfo = await credential.getUserInfo();
    logoutUri = credential.generateLogoutUrl();
    await storePrefs();
  }

  Future<void> storePrefs() async {
    if (credential != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userInfo', userInfo.toString());
      await prefs.setString('accessToken', tokenResponse.accessToken);
      await prefs.setString('logoutUri', logoutUri.toString());
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('userInfo');
    await prefs.remove('accessToken');

    var logoutUrl = prefs.getString('logoutUri');
    try {
      await launch(logoutUrl, forceWebView: true);
    } catch (e) {
      throw 'Could not launch $logoutUrl';
    }

    await prefs.remove('logoutUri');
  }
}
