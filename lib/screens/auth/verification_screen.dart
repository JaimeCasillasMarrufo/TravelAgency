import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('logo.png'),
                width: 250,
                height: 250,
              ),
              SizedBox(height: 10),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Verification Code',
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  context.go('/home/1');
                },
                style: ButtonStyle(
                  textStyle: WidgetStateProperty.all(Theme.of(context).textTheme.titleMedium),
                ),
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}