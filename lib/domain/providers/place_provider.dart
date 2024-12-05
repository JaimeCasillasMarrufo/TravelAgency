import 'package:flutter/material.dart';
import 'package:travel_agency/domain/datasources/place_datasources.dart';
import 'package:travel_agency/domain/entities/place.dart';

class PlaceProvider extends ChangeNotifier {
  PlaceDatasources datasources;
  List<Place> places = [];
  PlaceProvider({required this.datasources});

  Future getPlaces() async {
    places = await datasources.getPlaces();
    notifyListeners();
  }

  Future addPlace(Place place) async {
    final newPlace = await datasources.createPlace(place);
    places.add(place);
    notifyListeners();
  }
}
