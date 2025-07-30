import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/registeration_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.lightBlue,
        hintColor: Colors.blueAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineLarge: TextStyle(
            fontSize: 45.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => WelcomeScreen(),
        '/register': (context) => RegisterationScreen(),
        '/login': (context) => LoginScreen(),
        '/chat': (context) => ChatScreen(),
      },
    ),
  );
}
