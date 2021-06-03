import 'package:beerup_mobile/services/Authenticate.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  final Authenticate auth = new Authenticate();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 0, 0),
              child: Text(
                '',
                style: TextStyle(color: Colors.amber, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/biere2.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Bienvenue'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Faire une recherche'),
            onTap: () => {Navigator.pushNamed(context, '/recherche')},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Recevoir des suggestions de bières'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.collections_bookmark_outlined),
            title: Text('Consulter ses favoris'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              await auth.logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
