import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;

  final LatLng _initialPosition = const LatLng(20.5937, -100.3899); // Coordenadas iniciales

  int _currentIndex = 1; // El mapa está en el índice 1

  
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      const Center(child: Text('Menu Page', style: TextStyle(fontSize: 24))), 
      Scaffold( 
        body: GoogleMap(
          onMapCreated: (controller) {
            _mapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
            zoom: 12.0,
          ),
        ),
      ),
      const Center(child: Text('Logout Page', style: TextStyle(fontSize: 24))), 
    ];

    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF292827), 
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.grey, 
        showSelectedLabels: false, 
        showUnselectedLabels: false, 
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu.png', width: 24, height: 24),
            label: '', 
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/location.png', width: 24, height: 24),
            label: '', 
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/logout.png', width: 24, height: 24),
            label: '', 
          ),
        ],
      ),
    );
  }
}
