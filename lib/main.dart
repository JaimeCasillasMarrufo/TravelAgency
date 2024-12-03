import 'package:flutter/material.dart';
import 'package:travel_agency/config/app_router.dart';
import 'package:travel_agency/domain/datasources/place_datasources.dart';
import 'package:travel_agency/domain/providers/place_provider.dart';
import 'package:provider/provider.dart';

import 'splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                PlaceProvider(datasources: PlaceDatasources())),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        title: 'Travel Agency',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
      ),
    );
  }
}
