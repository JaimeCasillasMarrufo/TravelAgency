import 'package:flutter/material.dart';
import 'package:travel_agency/domain/datasources/place_datasources.dart';
import 'package:travel_agency/domain/providers/place_provider.dart';
import 'package:provider/provider.dart';
import 'package:travel_agency/widgets/info_places.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<PlaceProvider>(context, listen: false);
      provider.getPlaces();
    });
    final datasource = PlaceDatasources();
    datasource.getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final placeProvider = Provider.of<PlaceProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Place Map",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            Divider(color: Colors.white),
            const SizedBox(height: 20),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: []),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.builder(
                    itemCount: placeProvider.places.length,
                    itemBuilder: (context, index) {
                      final place = placeProvider.places[index];
                      return Card(
                        child: ListTile(
                          title: Text(place.title),
                          subtitle: Text(place.description),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
