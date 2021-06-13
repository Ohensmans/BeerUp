import 'package:beerup_mobile/models/TypeBiereModel.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:beerup_mobile/widgets/newBiereForm.dart';
import 'package:flutter/material.dart';

class NewBiere extends StatefulWidget {
  const NewBiere({Key key}) : super(key: key);

  @override
  _NewBiereState createState() => _NewBiereState();
}

class _NewBiereState extends State<NewBiere> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    List<TypeBiere> lTypes = data['lTypes'];
    String noPictureAvailableUrl = data['noPictureAvailableUrl'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/biere8.jpg'))),
              ),
              SizedBox(height: 20),
              NewBiereForm(
                lTypes: lTypes,
                noPictureAvailableUrl: noPictureAvailableUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
