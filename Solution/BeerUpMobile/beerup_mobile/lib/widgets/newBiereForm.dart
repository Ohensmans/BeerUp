import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/services/CallApi/BiereService.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:beerup_mobile/services/CallApi/ImageService.dart';
import 'package:uuid/uuid.dart';
import 'package:beerup_mobile/models/AvisModel.dart';
import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/models/TypeBiereModel.dart';
import 'package:beerup_mobile/services/CallApi/AvisService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewBiereForm extends StatefulWidget {
  final List<TypeBiere> lTypes;
  final String noPictureAvailableUrl;

  NewBiereForm({Key key, this.lTypes, this.noPictureAvailableUrl})
      : super(key: key);

  @override
  _NewBiereFormState createState() => _NewBiereFormState();
}

class _NewBiereFormState extends State<NewBiereForm> {
  Biere biere;
  String typeValue;
  final List<String> lTypesNom = [];

  String bieId = Uuid().v4().toString();
  String etaId = Uuid.NAMESPACE_NIL.toString();
  File _image;
  final picker = ImagePicker();

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
  final controllerNom = TextEditingController();
  final controllerBrasserie = TextEditingController();
  final controllerDescr = TextEditingController();
  final controllerDegre = TextEditingController();

  void initState() {
    super.initState();
    widget.lTypes.forEach((element) => lTypesNom.add(element.typBieNom));
    typeValue = typeValue == null ? lTypesNom[0] : typeValue;
  }

  Future getImage() async {
    //final pickedFile = await picker.getImage(source: ImageSource.camera);
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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

  String validateNom(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une valeur';
    }
    if (value.length > 100) {
      return 'Longueur maximale autorisée 100 caractères';
    }
    return null;
  }

  String validateBrasserie(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une valeur';
    }
    if (value.length > 200) {
      return 'Longueur maximale autorisée 100 caractères';
    }
    return null;
  }

  String validateDescr(String value) {
    if (value.length > 1000) {
      return 'Longueur maximale autorisée 1000 caractères';
    }
    return null;
  }

  String validateType(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez choisir une valeur';
    }
    return null;
  }

  String validateDegre(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer une valeur';
    }
    if (double.tryParse(value) == null) {
      return 'Veuillez entrer une valeur numérique';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                      'NOUVELLE BIERE',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 2.0,
                      ),
                    ),
                    TextFormField(
                      controller: controllerNom,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Nom de la bière',
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
                        return validateNom(value);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('Type de bière :',
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 12,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: DropdownButton<String>(
                            value: typeValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            dropdownColor: Colors.black,
                            style: const TextStyle(
                              color: Colors.greenAccent,
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.grey[800],
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                typeValue = newValue;
                              });
                            },
                            items: lTypesNom
                                .map((String item) => DropdownMenuItem<String>(
                                    child: Text(item), value: item))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: controllerBrasserie,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Nom de la brasserie',
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
                        return validateBrasserie(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerDegre,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Degré d'alcool",
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
                        return validateDegre(value);
                      },
                    ),
                    TextFormField(
                      controller: controllerDescr,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Description de la bière',
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
                        return validateDescr(value);
                      },
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: _image == null
                                  ? NetworkImage(widget.noPictureAvailableUrl)
                                  : FileImage(_image),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            getImage();
                          },
                          icon: Icon(Icons.add_a_photo),
                          label: Text(
                            _image == null
                                ? "Ajouter une photo"
                                : "Changer la photo",
                            style: TextStyle(
                                color: Colors.grey[200], fontSize: 12),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
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
                  Etablissement etab = new Etablissement.newOne(
                      controllerBrasserie.text.toString(), etaId);
                  etab = await EtabService().postEtab(etab);
                  String imagePath;

                  if (etab != null) {
                    if (_image != null) {
                      imagePath = await ImageService().postImage(_image);
                    }
                    if (imagePath != null) {
                      biere.biePhoto = imagePath;
                    }
                    biere.bieNom = controllerNom.text.toString();
                    biere.etaId = etab.etaId;
                    biere.bieDegreAlcool = double.parse(controllerDegre.text);
                    biere.typBieId = widget.lTypes
                        .firstWhere((element) => element.typBieNom == typeValue)
                        .typBieId;
                    if (controllerDescr.text != null) {
                      biere.bieDesc = controllerDescr.text.toString();
                    }
                    biere.bieId = bieId;

                    int code = await BiereService().postBiere(biere);

                    if (code != null && code == 429) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Vous ne pouvez créer que 5 nouvelles bières par jour'),
                        backgroundColor: Colors.red,
                      ));
                    }
                    if (code != null && code == 201) {
                      Avis newAvis = new Avis();
                      newAvis.acidMoyen =
                          int.parse(controllerAcid.text).toDouble();
                      newAvis.amerMoyen =
                          int.parse(controllerAmer.text).toDouble();
                      newAvis.cafeMoyen =
                          int.parse(controllerCafe.text).toDouble();
                      newAvis.caraMoyen =
                          int.parse(controllerCara.text).toDouble();
                      newAvis.fruitMoyen =
                          int.parse(controllerFruit.text).toDouble();
                      newAvis.houbMoyen =
                          int.parse(controllerHoub.text).toDouble();
                      newAvis.maltMoyen =
                          int.parse(controllerMalt.text).toDouble();
                      newAvis.sucrMoyen =
                          int.parse(controllerSucr.text).toDouble();
                      newAvis.noteMoyen =
                          int.parse(controllerNote.text).toDouble();
                      newAvis.bieId = bieId;

                      bool test = await AvisService().postAvisUser(newAvis);

                      if (test) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Avis enregistré'),
                          backgroundColor: Colors.green[700],
                        ));
                        await Future.delayed(Duration(seconds: 3));
                        Navigator.pushNamed(context, '/loadBiere',
                            arguments: {'biere': biere});
                      }
                    }
                  }
                }
              },
              child: Text("Sauvegarder la bière"),
            ),
          ),
        ],
      ),
    );
  }
}
