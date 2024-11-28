import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF292827), 
      body: Center(
        child: Image.asset(
          'assets/navbar_image.jpg', 
          width: 350, 
          height: 350,
        ),
      ),
    );
  }
}
