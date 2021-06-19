import 'dart:io';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:beerup_mobile/widgets/rechercheForm.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Recherche extends StatelessWidget {
  final picker = ImagePicker();

  Future getImage(BuildContext context) async {
    //final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File image = File(pickedFile.path);
      Navigator.pushReplacementNamed(context, '/loadResultatsPhoto',
          arguments: {
            'image': image,
          });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: Container(
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
                            image: AssetImage('assets/images/biere4.jpg'))),
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    'RECHERCHE PAR NOM',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 12.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Container(child: RechercheForm()),
                  SizedBox(height: 40.0),
                  Text(
                    'RECHERCHE PAR PHOTO',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 12.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.camera_alt),
                      iconSize: 48,
                      tooltip: 'Faire une recherche photo',
                      onPressed: () {
                        getImage(context);
                      },
                    ),
                  ),
                ],
              ))),
    );
  }
}
