import 'package:flutter/material.dart';
import 'package:travel_agency/widgets/info_places.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:
          Color.fromRGBO(30, 30, 30, 100), // Cambia este color al que desees
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0.8),
          child: Column(
            children: [
              Text(
                "Locations",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
              ),
              Divider(
                color: Color.fromRGBO(255, 255, 255, 100),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoPlaces(
                      title: "Berlin",
                      description: "descripcion",
                      color: Color.fromRGBO(49, 48, 48, 100)),
                  const SizedBox(height: 20),
                   InfoPlaces(
                      title: "Berlin",
                      description: "descripcion",
                      color: Color.fromRGBO(49, 48, 48, 100)),
                      
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
