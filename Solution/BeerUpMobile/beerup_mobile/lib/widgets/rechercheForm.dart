import 'package:flutter/material.dart';

class RechercheForm extends StatefulWidget {
  @override
  _RechercheFormState createState() => _RechercheFormState();
}

class _RechercheFormState extends State<RechercheForm> {
  final _formKey = GlobalKey<FormState>();
  final controllerSearch = TextEditingController();

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: TextFormField(
              controller: controllerSearch,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Entrez le nom recherché',
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
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer du texte pour votre recherche';
                }
                return null;
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              tooltip: 'Faire une recherche',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushReplacementNamed(context, '/loadResultats',
                      arguments: {
                        'text': controllerSearch.text,
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
