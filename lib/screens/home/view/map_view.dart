import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_agency/domain/entities/place.dart';
import 'package:travel_agency/domain/providers/place_provider.dart';
import 'package:travel_agency/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMarkers();
    });
  }

  void _loadMarkers() async {
    final provider = Provider.of<PlaceProvider>(context, listen: false);
    await provider.getPlaces();

    setState(() {
      _markers.clear();
      for (var incident in provider.places) {
        _markers.add(Marker(
            markerId: MarkerId(incident.id.toString()),
            position: LatLng(incident.lat, incident.lng),
            infoWindow: InfoWindow(
                title: incident.title, snippet: incident.description)));
      }
    });
  }

  void onLongPress(LatLng position) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Agregar lugar"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: "Titulo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: "Descripcion",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("Cancelar")),
              TextButton(
                  onPressed: () {
                    context.pop();
                    setState(() {
                      _addMarker(position, titleController.text,
                          descriptionController.text);
                      titleController.clear();
                      descriptionController.clear();
                    });
                  },
                  child: const Text("Aceptar")),
            ],
          );
        });
  }

  Future _addMarker(LatLng position, String title, String description) async {
    final placeProvider = Provider.of<PlaceProvider>(context, listen: false);
    final newPlace = Place(
        id: '',
        title: title,
        description: description,
        lat: position.latitude,
        lng: position.longitude,
        isEmailSent: false);

    try {
      await placeProvider.addPlace(newPlace);
      setState(() {
        _markers.add(Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: InfoWindow(title: title, snippet: description),
        ));
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
          target: LatLng(21.128010, -101.673568), zoom: 15),
      onLongPress: onLongPress,
      markers: _markers,
    );
  }
}
