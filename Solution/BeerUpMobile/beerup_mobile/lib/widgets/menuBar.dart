import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  MenuBar({Key key, this.appBar}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black54,
      title: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/load_home');
        },
        child: Text(
          'BeerUp',
          style: TextStyle(
            color: Colors.greenAccent[400],
            fontSize: 20.0,
          ),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Faire une recherche',
          onPressed: () {
            Navigator.pushNamed(context, '/recherche');
          },
        ),
        IconButton(
          icon: Icon(Icons.star),
          tooltip: 'Demander une suggestion',
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.collections_bookmark_outlined),
          tooltip: 'Voir ses favoris',
          onPressed: () {},
        ),
      ],
    );
  }
}
