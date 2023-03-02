import 'package:animalogy/Home/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animalogy',
      home: AnimatedSplashScreen(
        backgroundColor: Color(0xFFf9f5f1),
        splashIconSize: 80,
        splash: 'assets/logo.png',
        nextScreen: FirstPage(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 3000,
      ),
    );
  }
}