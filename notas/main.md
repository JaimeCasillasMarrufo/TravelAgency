import 'package:flutter/material.dart';
import 'package:travel_agency/domain/datasources/place_datasources.dart';
import 'package:travel_agency/domain/providers/place_provider.dart';
import 'package:provider/provider.dart';
 
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
