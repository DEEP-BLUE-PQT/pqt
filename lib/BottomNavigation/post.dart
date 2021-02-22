import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';

import 'navigation.dart';

class Post extends StatefulWidget {
  static String route = "Post";
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: Color(0xFF3D00E0),
        title: Text("Post"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '',
            ),
          ],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            if (selectedIndex == 0) {
              Navigator.pushNamed(context, Bnavigation.route);
            } else if (selectedIndex == 1) {
              Navigator.pushNamed(context, Myappointment.route);
            } else if (selectedIndex == 2) {
              Navigator.pushNamed(context, Post.route);
            }
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Book Appointment',
            selectedBackgroundColor: Color(0xFF3D00E0),
          ),
          FFNavigationBarItem(
            iconData: Icons.list,
            label: 'My Appointment',
            selectedBackgroundColor: Color(0xFF3D00E0),
          ),
          FFNavigationBarItem(
            iconData: Icons.add_a_photo_rounded,
            label: 'Post',
            selectedBackgroundColor: Color(0xFF3D00E0),
          ),
        ],
      ),
    );
  }
}
