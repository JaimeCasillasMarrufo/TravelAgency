import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(
              image: AssetImage('logo.png'),
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                textStyle: WidgetStateProperty.all(Theme.of(context).textTheme.titleMedium),
              ),
              child: const Text('Log In'),
            ),
            const SizedBox(height: 10),
            Text(
              'Don\'t have an account?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: () {
                context.go('/auth/register');
              },
              child: const Text('Register now'),
            ),
          ]),
        ),
      ),
    );
  }
}
