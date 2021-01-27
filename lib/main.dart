import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/splashScreen/splash.dart';
import 'package:flutter_app_pqt_splash/userDetails/details.dart';
import 'package:flutter_app_pqt_splash/userDetails/details2.dart';
import 'BottomNavigation/makeappointment2follower.dart';
import 'BottomNavigation/navigation.dart';
import 'BottomNavigation/post.dart';
import 'BottomNavigation/makeappointment.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: {
      Details.route: (context) => Details(),
      Details2.route: (context) => Details2(),
      Bnavigation.route: (context) => Bnavigation(),
      Myappointment.route: (context) => Myappointment(),
      Post.route: (context) => Post(),
      MakeAppointment.route: (context) => MakeAppointment(),
      MakeAppt.route: (context) => MakeAppt(),
    },
  ));
}
