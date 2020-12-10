import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/admin_details/admin_details.dart';
import 'package:flutter_app_pqt_splash/dashboard/user_admin_selection.dart';
import 'package:flutter_app_pqt_splash/splashScreen/splash.dart';
import 'package:flutter_app_pqt_splash/userDetails/details.dart';
import 'package:flutter_app_pqt_splash/userDetails/details2.dart';
import 'BottomNavigation/navigation.dart';
import 'BottomNavigation/post.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    routes: {
      Details.route: (context) => Details(),
      Details2.route: (context) => Details2(),
      AdminDetails.route: (context) => AdminDetails(),
      Bnavigation.route: (context) => Bnavigation(),
      Myappointment.route: (context) => Myappointment(),
      Post.route: (context) => Post(),
    },
  ));
}
