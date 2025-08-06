import 'package:flutter/material.dart';
import 'package:chat_app/components/round_button.dart';
import 'package:typewritertext/typewritertext.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Image.asset('images/logo.png', height: 60.0),
                ),
                TypeWriter.text(
                  'Flash Chat',
                  style: Theme.of(context).textTheme.headlineLarge,
                  duration: const Duration(milliseconds: 500),
                  repeat: true,
                ),
              ],
            ),
            SizedBox(height: 48.0),
            RoundButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              text: 'Login',
            ),
            SizedBox(height: 16.0),
            RoundButton(
              backgroundColor: Theme.of(context).hintColor,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
