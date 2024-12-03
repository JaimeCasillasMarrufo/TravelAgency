import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children : [
            Image(
              image: AssetImage('logo.png'),
              width: 250,
              height: 250,
            ),
            SizedBox(height: 10),
            Text(
              'Create your account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                textStyle: WidgetStateProperty.all(Theme.of(context).textTheme.titleMedium),
              ),
              child: Text('Register'),
            ),
            SizedBox(height: 10),
            Text(
              'Already have an account?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () {
                context.go('/auth/login');
              },
              child: Text('Log In'),
            ),
          ]
        ),
      ),
    ),
    );
  }
}