import 'package:flutter/material.dart';
import 'package:travel_agency/screens/home/view/home_view.dart';
import 'package:travel_agency/screens/home/view/map_view.dart';
import 'package:travel_agency/widgets/bottom_navbar.dart';


class HomeScreen extends StatelessWidget {
  final int viewIndex;
  const HomeScreen({super.key, required this.viewIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: viewIndex, children: const [
        HomeView(),
        MapView(),
      ]),
      bottomNavigationBar: BottomNavbar(index: viewIndex,),
      backgroundColor: Theme.of(context).colorScheme.secondary,
    );
  }
}