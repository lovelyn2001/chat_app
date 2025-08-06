import 'package:flutter/material.dart';
import 'package:chat_app/components/round_button.dart';
import 'package:chat_app/constants.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
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
              onSubmitted: (value) {
                //Do something with the user input.
              },
              decoration: textFieldDecoration,
            ),
            SizedBox(height: 8.0),
            TextField(
              onSubmitted: (value) {
                //Do something with the user input.
              },
              decoration: textFieldDecoration.copyWith(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RoundButton(
                backgroundColor: Theme.of(context).hintColor,
                onPressed: () {
                  // Navigator.pushNamed(context, '/register');
                },
                text: 'Register',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
