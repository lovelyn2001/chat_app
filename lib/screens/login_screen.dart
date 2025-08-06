import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset('images/logo.png', height: 200.0),
            ),
            SizedBox(height: 48.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onSubmitted: (value) {
                //Do something with the user input.
              },
              decoration: textFieldDecoration,
            ),
            SizedBox(height: 8.0),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onSubmitted: (value) {
                //Do something with the user input.
              },
              decoration: textFieldDecoration.copyWith(
                hintText: 'enter your password',
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RoundButton(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  // Navigator.pushNamed(context, '/login');
                },
                text: 'Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
