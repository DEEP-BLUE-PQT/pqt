import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/makeappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/navigation.dart';
import 'package:flutter_app_pqt_splash/userDetails/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class MyApp extends StatelessWidget {
//   APIservice apIservice = APIservice();
//
//   getDocList() async {
//     await apIservice.getDoctorList();
//   }
//
//   getSlotsList() async {
//     await apIservice.getSlotsList();
//   }
//
//   String check_Contact;
//   bool checking = false;
//   Future<bool> check() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     check_Contact = prefs.getString("userContact");
//     if (check_Contact != '') {
//       checking = true;
//     }
//   }
//
//   getScreen() async {
//     await check();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     getDocList();
//     getSlotsList();
//     getScreen();
//     return Scaffold(
//       body: AnimatedSplashScreen(
//           duration: 3000,
//           splash: Image.asset(
//             'assets/images/test.jpg',
//             colorBlendMode: BlendMode.colorBurn,
//             height: 5000,
//             width: 5000,
//           ),
//           nextScreen: checking ? MakeAppointment() : Details(),
//           splashTransition: SplashTransition.slideTransition,
//           backgroundColor: Colors.white),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  APIservice apIservice = APIservice();
  getDocList() async {
    await apIservice.getDoctorList();
  }

  getSlotsList() async {
    await apIservice.getSlotsList();
  }

  String check_Contact;
  bool checking = false;
  Future<bool> check() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    check_Contact = prefs.getString("userContact");
    if (check_Contact != '') {
      checking = true;
    }
  }

  getScreen() async {
    await check();
  }

  @override
  void initState() {
    getDocList();
    getSlotsList();
    getScreen();
  }

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
          nextScreen: checking ? Myappointment() : Details(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white),
    );
  }
}
