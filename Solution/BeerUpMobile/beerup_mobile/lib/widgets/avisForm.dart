import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/services/CallApi/AvisService.dart';
import 'package:flutter/material.dart';

class AvisForm extends StatefulWidget {
  final String ressourceBaseUrl;
  final Biere biere;
  final Avis avisUser;

  AvisForm({Key key, this.ressourceBaseUrl, this.biere, this.avisUser})
      : super(key: key);

  @override
  _AvisFormState createState() => _AvisFormState();
}

class _AvisFormState extends State<AvisForm> {
  Map data = {};
  final _formKey = GlobalKey<FormState>();
  final controllerAcid = TextEditingController();
  final controllerCafe = TextEditingController();
  final controllerCara = TextEditingController();
  final controllerFruit = TextEditingController();
  final controllerHoub = TextEditingController();
  final controllerMalt = TextEditingController();
  final controllerSucr = TextEditingController();
  final controllerNote = TextEditingController();
  final controllerAmer = TextEditingController();

  String validateAvis(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une valeur';
    }
    var test = int.tryParse(value);
    if (test == null) {
      return 'le chiffre doit être un entier';
    }
    if (int.parse(value) < 0 || int.parse(value) > 5) {
      return 'le chiffre doit être compris entre 0 et 5';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.avisUser.acidMoyen != 0 ||
        widget.avisUser.cafeMoyen != 0 ||
        widget.avisUser.caraMoyen != 0 ||
        widget.avisUser.fruitMoyen != 0 ||
        widget.avisUser.houbMoyen != 0 ||
        widget.avisUser.maltMoyen != 0 ||
        widget.avisUser.sucrMoyen != 0 ||
        widget.avisUser.amerMoyen != 0 ||
        widget.avisUser.noteMoyen != 0) {
      controllerAcid.text = widget.avisUser.acidMoyen.toString();
      controllerCafe.text = widget.avisUser.cafeMoyen.toString();
      controllerCara.text = widget.avisUser.caraMoyen.toString();
      controllerFruit.text = widget.avisUser.fruitMoyen.toString();
      controllerHoub.text = widget.avisUser.houbMoyen.toString();
      controllerMalt.text = widget.avisUser.maltMoyen.toString();
      controllerSucr.text = widget.avisUser.sucrMoyen.toString();
      controllerAmer.text = widget.avisUser.amerMoyen.toString();
      controllerNote.text = widget.avisUser.noteMoyen.toString();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SAVEURS',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 2.0,
                      ),
                    ),
                    TextFormField(
                      controller: controllerAcid,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Acidité /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerAmer,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Amertume /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerCafe,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Café /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerCara,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Caramel /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerFruit,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Fruitée /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerHoub,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Houblonnée /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerMalt,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Maltée /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerSucr,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Sucrée /5',
                        labelStyle: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[800]),
                        ),
                      ),
                      validator: (value) {
                        return validateAvis(value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: controllerNote,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Note globale /5',
              labelStyle: TextStyle(
                color: Colors.grey[200],
                fontSize: 12,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[800]),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[800]),
              ),
            ),
            validator: (value) {
              return validateAvis(value);
            },
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  Avis newAvis = new Avis();
                  newAvis.acidMoyen = int.parse(controllerAcid.text).toDouble();
                  newAvis.amerMoyen = int.parse(controllerAmer.text).toDouble();
                  newAvis.cafeMoyen = int.parse(controllerCafe.text).toDouble();
                  newAvis.caraMoyen = int.parse(controllerCara.text).toDouble();
                  newAvis.fruitMoyen =
                      int.parse(controllerFruit.text).toDouble();
                  newAvis.houbMoyen = int.parse(controllerHoub.text).toDouble();
                  newAvis.maltMoyen = int.parse(controllerMalt.text).toDouble();
                  newAvis.sucrMoyen = int.parse(controllerSucr.text).toDouble();
                  newAvis.noteMoyen = int.parse(controllerNote.text).toDouble();
                  newAvis.bieId = widget.biere.bieId;

                  bool test = await AvisService().postAvisUser(newAvis);
                  if (test) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Avis enregistré'),
                      backgroundColor: Colors.green[700],
                    ));
                  }
                }
              },
              child: Text("Sauvegarder mon avis"),
            ),
          ),
        ],
      ),
    );
  }
}
