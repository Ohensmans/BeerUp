import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:beerup_mobile/services/CallApi/EtabService.dart';
import 'package:beerup_mobile/widgets/listeEtabs.dart';
import 'package:beerup_mobile/widgets/maps.dart';
import 'package:beerup_mobile/widgets/menuBar.dart';
import 'package:beerup_mobile/widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class OuTrouver extends StatefulWidget {
  const OuTrouver({Key key}) : super(key: key);

  final String brasserie = 'Brasserie';
  final String bar = 'Bar';
  final String magasin = 'Magasin';
  final String restaurant = 'Restaurant';
  final double distance20 = 20;
  final double distance50 = 50;
  final double distance100 = 100;

  @override
  _OuTrouverState createState() => _OuTrouverState();
}

class _OuTrouverState extends State<OuTrouver> {
  Map data = {};
  double distance = 20;
  List<Etablissement> lEtaSponso;
  List<Etablissement> lEtabs;
  bool magasinFilter = false;
  bool barFilter = false;

  @override
  void initState() {
    super.initState();
    magasinFilter = false;
    barFilter = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    lEtaSponso = data['lEtabSponso'];
    lEtabs = data['lEtabs'];
  }

  _filterBrasserie() {
    List<Etablissement> lFilter = data['lEtabs'];
    lFilter = lFilter
        .where((element) =>
            element.nomTypeEta == widget.brasserie ||
            element.nomTypeEta == widget.bar ||
            element.nomTypeEta == widget.restaurant)
        .toList();
    setState(() {
      lEtabs = lFilter;
      magasinFilter = false;
      barFilter = true;
    });
  }

  _filterMagasin() {
    List<Etablissement> lFilter = data['lEtabs'];
    lFilter = lFilter
        .where((element) => element.nomTypeEta == widget.magasin)
        .toList();
    setState(() {
      lEtabs = lFilter;
      magasinFilter = true;
      barFilter = false;
    });
  }

  _noFilter() {
    List<Etablissement> lFilter = data['lEtabs'];
    setState(() {
      lEtabs = lFilter;
      magasinFilter = false;
      barFilter = false;
    });
  }

  _changeDistance(double newDistance, double startLatitude,
      double startLongitude, String bieId) async {
    List<Etablissement> lEta = await EtabService()
        .getEtabDistance(newDistance, startLatitude, startLongitude, bieId);
    setState(() {
      distance = newDistance;
      data['lEtabs'] = lEta;
      lEtabs = lEta;
      magasinFilter = false;
      barFilter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double startLatitude = data['startLatitude'];
    double startLongitude = data['startLongitude'];
    String ressourceBaseUrl = data['ressourceBaseUrl'];
    String noPicture = data['noPicture'];
    String bieId = data['bieId'];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: NavDrawer(),
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/images/bar1.jpg'))),
              ),
              SizedBox(height: 20),
              bieId != null && bieId.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: widget.distance20 != distance
                                  ? Colors.green[700]
                                  : Colors.red),
                          onPressed: () {
                            if (widget.distance20 != distance) {
                              _changeDistance(widget.distance20, startLatitude,
                                  startLongitude, bieId);
                            }
                          },
                          label: Text(
                              widget.distance20.toStringAsPrecision(2) + ' km'),
                          icon: Icon(
                            Icons.blur_circular,
                            color: Colors.grey[200],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: widget.distance50 != distance
                                  ? Colors.green[700]
                                  : Colors.red),
                          onPressed: () {
                            if (widget.distance50 != distance) {
                              _changeDistance(widget.distance50, startLatitude,
                                  startLongitude, bieId);
                            }
                          },
                          label: Text(
                              widget.distance50.toStringAsPrecision(2) + ' km'),
                          icon: Icon(
                            Icons.blur_circular,
                            color: Colors.grey[200],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: widget.distance100 != distance
                                  ? Colors.green[700]
                                  : Colors.red),
                          onPressed: () {
                            if (widget.distance100 != distance) {
                              _changeDistance(widget.distance100, startLatitude,
                                  startLongitude, bieId);
                            }
                          },
                          label: Text(
                              widget.distance100.toStringAsPrecision(3) +
                                  ' km'),
                          icon: Icon(
                            Icons.blur_circular,
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    )
                  : Container(),
              bieId != null && bieId.isNotEmpty
                  ? SizedBox(height: 20)
                  : Container(),
              Center(
                child: SizedBox(
                  width: 350.0,
                  height: 300.0,
                  child: Maps(
                    startLongitude: startLongitude,
                    startLatitude: startLatitude,
                    lEtaSpon: lEtaSponso,
                    lEtab: lEtabs,
                  ),
                ),
              ),
              SizedBox(height: 20),
              bieId != null && bieId.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: !magasinFilter
                                      ? Colors.green[700]
                                      : Colors.red),
                              onPressed: () {
                                _filterMagasin();
                              },
                              label: Text(
                                'MAGASINS',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.grey[200],
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: !barFilter
                                      ? Colors.green[700]
                                      : Colors.red),
                              onPressed: () {
                                _filterBrasserie();
                              },
                              label: Text(
                                'BARS/BRASSERIES',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              icon: Icon(
                                Icons.local_drink_outlined,
                                color: Colors.grey[200],
                              ),
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  primary: !barFilter && !magasinFilter
                                      ? Colors.red
                                      : Colors.green[700]),
                              onPressed: () {
                                _noFilter();
                              },
                              label: Text(
                                'TOUS',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              icon: Icon(
                                Icons.blur_circular,
                                color: Colors.grey[200],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              lEtaSponso.isNotEmpty ? SizedBox(height: 20) : Container(),
              lEtaSponso.isNotEmpty
                  ? Text(
                      'Annonce Sponsorisée:',
                      style: TextStyle(
                        color: Colors.amber[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  : Container(),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ListeEtabs(
                  lEtabs: lEtaSponso,
                  ressourceBaseUrl: ressourceBaseUrl,
                  noPictureUrl: noPicture,
                ),
              ),
              lEtaSponso.isNotEmpty ? SizedBox(height: 20.0) : Container(),
              lEtabs.isNotEmpty && bieId != null && bieId.isNotEmpty
                  ? Text(
                      'Liste des établissements dans un rayon de : ' +
                          distance.toString() +
                          ' km',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 12.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  : Container(),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: ListeEtabs(
                  lEtabs: lEtabs,
                  ressourceBaseUrl: ressourceBaseUrl,
                  noPictureUrl: noPicture,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
