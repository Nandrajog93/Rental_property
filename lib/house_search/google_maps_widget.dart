import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class LatLong {
  final String name;
  final double lat;
  final double long;
  final String location;

  LatLong({
    required this.name,
    required this.lat,
    required this.long,
    required this.location,
  });
}

class CustomGoogleMap extends StatefulWidget {
  final LatLng center;
  final List<LatLong> latlong;

  CustomGoogleMap({Key? key, required this.center, required this.latlong}) : super(key: key);

  @override
  CustomGoogleMapState createState() => CustomGoogleMapState();
}

class CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  void moveCameraToPosition(double latitude, double longitude) {
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 5),
    );
  }

  void _loadMarkers() {
    Set<Marker> newMarkers = widget.latlong.map((house) {
      return Marker(
        markerId: MarkerId(house.name),
        position: LatLng(house.lat, house.long),
        infoWindow: InfoWindow(
          title: house.name,
          snippet: house.location,
        ),
      );
    }).toSet();

    setState(() {
      markers = newMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
        _loadMarkers();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showAllMarkers();
        });
      },
      initialCameraPosition: CameraPosition(
        target: widget.center,
        zoom: 10,
      ),
      markers: markers,
    );
  }

  void _showAllMarkers() {
    if (markers.isEmpty) return;

    var bounds = LatLngBounds(
      southwest: LatLng(
        markers.map((m) => m.position.latitude).reduce((a, b) => a < b ? a : b),
        markers.map((m) => m.position.longitude).reduce((a, b) => a < b ? a : b),
      ),
      northeast: LatLng(
        markers.map((m) => m.position.latitude).reduce((a, b) => a > b ? a : b),
        markers.map((m) => m.position.longitude).reduce((a, b) => a > b ? a : b),
      ),
    );

    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }
}






