import 'package:beerup_mobile/models/BiereDescrModel.dart';
import 'package:beerup_mobile/widgets/listeBieres.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class FavorisPage extends StatefulWidget {
  @override
  _FavorisPageState createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  Map data = {};

  nameFilter(Map mapData, bool upFilter) {
    bool newUpFilter = !upFilter;
    List<Biere> lBieresSort = mapData['lBieres'];
    lBieresSort.sort((a, b) => a.bieNom.compareTo(b.bieNom));
    if (!newUpFilter) {
      lBieresSort.reversed;
    }
    mapData['lBieres'] = lBieresSort;
    mapData['upFilter'] = newUpFilter;

    setState(() {
      data = mapData;
    });
  }

  typeFilter(Map mapData, bool upFilter) {
    bool newUpFilter = !upFilter;
    List<Biere> lBieresSort = mapData['lBieres'];
    lBieresSort.sort((a, b) => a.typBieNom.compareTo(b.typBieNom));
    if (!newUpFilter) {
      lBieresSort.reversed;
    }
    mapData['lBieres'] = lBieresSort;
    mapData['upFilter'] = newUpFilter;

    setState(() {
      data = mapData;
    });
  }

  noteFilter(Map mapData, bool upFilter) {
    bool newUpFilter = !upFilter;
    List<Biere> lBieresSort = mapData['lBieres'];
    lBieresSort.sort((a, b) => a.noteMoyen.compareTo(b.noteMoyen));
    if (!newUpFilter) {
      lBieresSort.reversed;
    }
    mapData['lBieres'] = lBieresSort;
    mapData['upFilter'] = newUpFilter;

    setState(() {
      data = mapData;
    });
  }

  brasseurFilter(Map mapData, bool upFilter) {
    bool newUpFilter = !upFilter;
    List<Biere> lBieresSort = mapData['lBieres'];
    lBieresSort.sort((a, b) => a.etaNom.compareTo(b.etaNom));
    if (!newUpFilter) {
      lBieresSort.reversed;
    }
    mapData['lBieres'] = lBieresSort;
    mapData['upFilter'] = newUpFilter;

    setState(() {
      data = mapData;
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    bool upFilter = data['upFilter'] != null ? data['upFilter'] : true;
    String ressourceBaseUrl = data['ressourceBaseUrl'];
    List<Biere> lBieres = data['lBieres'];
    List<bool> lIsFavorite = data['lIsFavorite'];

    return Scaffold(
        backgroundColor: Colors.black,
        drawer: NavDrawer(),
        appBar: MenuBar(appBar: AppBar()),
        body: SingleChildScrollView(
          child: Container(
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
                    SizedBox(height: 40),
                    Text(
                      'Vos favoris:',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: ListeBieres(
                        lBieres: lBieres,
                        ressourceBaseUrl: ressourceBaseUrl,
                        lIsFavorite: lIsFavorite,
                        isSuggestion: false,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tri :',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 14.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            nameFilter(data, upFilter);
                          },
                          label: Text('par nom'),
                          icon: Icon(
                            upFilter
                                ? Icons.arrow_upward_rounded
                                : Icons.arrow_downward_rounded,
                            color: Colors.grey[200],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            typeFilter(data, upFilter);
                          },
                          label: Text('par type'),
                          icon: Icon(
                            upFilter
                                ? Icons.arrow_upward_rounded
                                : Icons.arrow_downward_rounded,
                            color: Colors.grey[200],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            noteFilter(data, upFilter);
                          },
                          label: Text('par note'),
                          icon: Icon(
                            upFilter
                                ? Icons.arrow_upward_rounded
                                : Icons.arrow_downward_rounded,
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            brasseurFilter(data, upFilter);
                          },
                          label: Text('par brasseur'),
                          icon: Icon(
                            upFilter
                                ? Icons.arrow_upward_rounded
                                : Icons.arrow_downward_rounded,
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
