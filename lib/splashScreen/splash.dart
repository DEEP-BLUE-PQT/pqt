import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/userDetails/details.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/images/test.jpg',
            colorBlendMode: BlendMode.colorBurn,
            height: 5000,
            width: 5000,
          ),
          nextScreen: Details(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white),
    );
  }
}
