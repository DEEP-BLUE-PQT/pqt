import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/dashboard/user_admin_selection.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedSplashScreen(
            duration: 3000,
            splash: Image.asset(
              'assets/images/test.jpg',
              colorBlendMode: BlendMode.colorBurn,
              height: 5000,
              width: 5000,
            ),
            nextScreen: AdminSel(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.white),
      ),
    );
  }
}
