import 'package:flutter/material.dart';
import 'package:travel_agency/config/app_router.dart';
import 'package:travel_agency/domain/datasources/place_datasources.dart';
import 'package:travel_agency/domain/providers/place_provider.dart';
import 'package:provider/provider.dart';

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
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        title: 'Travel Agency',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 104, 198, 200),
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 41, 40, 39),
            onSecondary: Colors.white70,
            error: Colors.redAccent,
            onError: Colors.white70,
            surface: Color.fromARGB(100, 95, 93, 91),
            onSurface: Colors.white70,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 41, 40, 39),
          buttonTheme: ButtonThemeData(
            buttonColor: Theme.of(context).colorScheme.primary,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      ),
    );
  }
}
