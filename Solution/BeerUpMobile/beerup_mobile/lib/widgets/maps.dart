import 'dart:async';
import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps(
      {Key key,
      this.startLatitude,
      this.startLongitude,
      this.lEtab,
      this.lEtaSpon})
      : super(key: key);

  final double startLatitude;
  final double startLongitude;
  final List<Etablissement> lEtab;
  final List<Etablissement> lEtaSpon;

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition startPosition;
  List<Marker> lMarker = [];

  @override
  void initState() {
    super.initState();
    startPosition = CameraPosition(
      target: LatLng(widget.startLatitude, widget.startLongitude),
      zoom: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    lMarker = _createMarkers();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              width: 350.0,
              height: 300.0,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: startPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set.from(lMarker),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Marker> _createMarkers() {
    List<Marker> lMarkers = [];
    widget.lEtaSpon.forEach((element) {
      lMarkers.add(Marker(
        markerId: MarkerId(element.etaId),
        position: LatLng(double.parse(element.etaCoordLat),
            double.parse(element.etaCoordLong)),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(
          title: element.etaNom,
          onTap: () {
            Navigator.pushNamed(context, '/loadEtab',
                arguments: {'etab': element});
          },
        ),
      ));
    });
    widget.lEtab.forEach((element) {
      lMarkers.add(Marker(
        markerId: MarkerId(element.etaId),
        position: LatLng(double.parse(element.etaCoordLat),
            double.parse(element.etaCoordLong)),
        icon: element.estOuvert
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
            : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
          title: element.etaNom,
          onTap: () {
            Navigator.pushNamed(context, '/loadEtab',
                arguments: {'etab': element});
          },
        ),
      ));
    });
    return lMarkers;
  }
}
