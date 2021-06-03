import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: Container(
        child: (Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/biere5.jpg'))),
              ),
              SizedBox(height: 40.0),
              Center(
                child: Text('Pas de résultat trouvé !',
                    style: TextStyle(
                      color: Colors.red,
                    )),
              ),
              SizedBox(height: 40.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/recherche');
                  },
                  child: Text('Affiner la recherche'),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Ajouter une bière à l'application"),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
