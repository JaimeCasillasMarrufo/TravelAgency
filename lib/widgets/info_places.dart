import 'package:flutter/material.dart';

class InfoPlaces extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const InfoPlaces({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(description,
                style: const TextStyle(
                  color: Color.fromRGBO(176, 176, 176, 100),
                  fontSize: 14,
                )),
          ],
        ));
  }
}
