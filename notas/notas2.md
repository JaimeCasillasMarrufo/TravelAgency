import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController _mapController;

  final LatLng _initialPosition = const LatLng(20.5937, -100.3899);
  @override
  Widget build(BuildContext context) {
    return Text("Hola");
  }
}



