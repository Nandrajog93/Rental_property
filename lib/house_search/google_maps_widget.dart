import 'dart:async';
import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:google_maps/google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui_web' as ui;
import 'package:web/src/dom/html.dart';
//import 'package:google_maps/google_maps.dart';

//import 'package:google_maps_flutter/google_maps_flutter.dart' as GoogleMaps;

class CustomGoogleMap extends StatelessWidget {
  final LatLng center;

  CustomGoogleMap({required this.center});

  @override
  Widget build(BuildContext context) {
    String htmlId = "7";

    // This widget does not need the platformViewRegistry because it is for web platform.

    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 10,
      ),
      markers: Set<Marker>.of([
        Marker(
          markerId: MarkerId("selected_location"),
          position: center,
          infoWindow: InfoWindow(
            title: 'Selected House Location',
          ),
        ),
      ]),
    );
  }
}