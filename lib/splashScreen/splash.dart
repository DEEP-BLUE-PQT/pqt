import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/makeappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/navigation.dart';
import 'package:flutter_app_pqt_splash/sqlite/sqllite2.dart';
import 'package:flutter_app_pqt_splash/userDetails/details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

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

  getPostList() async {
    await apIservice.getPosts();
  }

  // getSlotsList() async {
  //   await apIservice.getSlotsList();
  // }

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

  cacheAllImage() async {
    CachedNetworkImage(
      placeholder: (context, url) => CircularProgressIndicator(),
      imageUrl: 'https://picsum.photos/250?image=9',
    );

    // );

    print("8888888888888888888888");
    print("caching done");
  }

  // db DB = db(
  //     depName: depName,
  //     docName: docName,
  //     starttime: slotChoosen.split('-')[0],
  //     endtime: slotChoosen.split('-')[1],
  //     dateChoosen: dateChoosen,
  //     name: nameOfPatient,
  //     pcotDisplay: pcotDisplay,
  //     error: error,
  //     scheduler: scheduler,
  //     displayTime: displayTime,
  //     oldWaitingTime: oldWaitingTime,
  //     pcit1: pcit1,
  //     pcit2: pcit2,
  //     pcit3: pcit3,
  //     wt2: wt2,
  //     wt3: wt3);
  //
  // getDBDone() async {
  //   try {
  //     await DB.Create();
  //   } catch (error) {
  //     print("here baby");
  //   }
  // }

  @override
  void initState() {
    getDocList();
    getPostList();
    // getSlotsList();
    getScreen();
    cacheAllImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 3000,
          splash: Image.asset(
            'assets/images/Aasaan-Logo-PQT12-Team.png',
            colorBlendMode: BlendMode.colorBurn,
          ),
          nextScreen: checking ? Myappointment() : Details(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white),
    );
  }
}
