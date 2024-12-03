import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_agency/config/app_router.dart';

class BottomNavbar extends StatelessWidget {
  final int index;
  const BottomNavbar({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.transparent,
        onTap: (value) {
          switch (value) {
            case 0:
              context.go("/home/0");
              break;
            case 1:
              context.go("/home/1");
              break;
            case 2:
              context.go("/home/2");
              break;
          }
        },
        color: Colors.black,
        items: const [
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
          Icon(
            Icons.map_outlined,
            color: Colors.white,
          ),
           Icon(
            Icons.login,
            color: Colors.white,
          ),
        ]);
  }
}
