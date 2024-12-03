import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travel_agency/domain/entities/place.dart';

class PlaceDatasources {
  Future<List<Place>> getPlaces() async {
    try {
      var dio = Dio();
      dio.options.baseUrl = "https://api-incident.juanfrausto.com/api/";
      final response = await dio.get("/incidents");
      final data = response.data as List;
      final place = Place.fromJson(data[0]);
      return data.map((item) => Place.fromJson(item)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<Place> createPlace(Place place) async {
    try {
      var dio = Dio();
      dio.options.baseUrl = "https://api-incident.juanfrausto.com/api/";
      final response = await dio.post("/incidents", data: {
        "title": place.title,
        "description": place.description,
        "lat": place.lat,
        "lng": place.lng,
      });

      return Place.fromJson(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers = {"autorization": "Bearer"};
  }
}
