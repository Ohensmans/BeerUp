import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:flutter/material.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/NavDrawer.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data != null && data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments;
    Biere biere = data['biere'];
    String noPicture = data['noPicture'];
    String bierePicture = data['bierePicture'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/biere7.png'))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Proposition du moment',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                        child: Text(
                      biere.bieNom != null ? biere.bieNom : '',
                      style: TextStyle(
                          color: Colors.amber[900],
                          letterSpacing: 1.0,
                          fontSize: 18.0),
                    )),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(
                                        biere.biePhoto != null &&
                                                biere.biePhoto.isNotEmpty
                                            ? bierePicture + biere.biePhoto
                                            : noPicture))),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    'BRASSERIE',
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 12.0,
                                      letterSpacing: 2.0,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    biere.etaNom != null ? biere.etaNom : '',
                                    style: TextStyle(
                                        color: Colors.greenAccent[400],
                                        letterSpacing: 1.0,
                                        fontSize: 18.0),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(8, 30, 0, 0),
                                  child: Text(
                                    'TYPE DE BIERE',
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 12.0,
                                      letterSpacing: 2.0,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    biere.typBieNom != null
                                        ? biere.typBieNom
                                        : '',
                                    style: TextStyle(
                                        color: Colors.greenAccent[400],
                                        letterSpacing: 1.0,
                                        fontSize: 18.0),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(8, 40, 0, 0),
                                  child: Text(
                                    'NOTE MOYENNE',
                                    style: TextStyle(
                                      color: Colors.grey[200],
                                      fontSize: 12.0,
                                      letterSpacing: 2.0,
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Text(
                                    biere.noteMoyen != null
                                        ? biere.noteMoyen.toStringAsFixed(1)
                                        : 'not found',
                                    style: TextStyle(
                                        color: Colors.greenAccent[400],
                                        letterSpacing: 1.0,
                                        fontSize: 18.0),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
                      child: Text(
                        'DESCRIPTION DE LA BIERE',
                        style: TextStyle(
                          color: Colors.amber[900],
                          fontSize: 12.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        biere.bieDesc != null ? biere.bieDesc : '',
                        style: TextStyle(
                            color: Colors.grey[200],
                            letterSpacing: 1.0,
                            fontSize: 14.0),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.grading_sharp,
                            color: Colors.grey[200],
                          ),
                          label: Text('Voir la fiche'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/loadBiere',
                                arguments: {'biere': biere});
                          },
                        ),
                        ElevatedButton.icon(
                          icon: Icon(
                            Icons.map,
                            color: Colors.grey[200],
                          ),
                          label: Text('Où en trouver ?'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/loadOuTrouver',
                                arguments: {'bieId': biere.bieId});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
