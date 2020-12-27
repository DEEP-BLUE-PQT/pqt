import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/post.dart';

import 'add_doctors.dart';
import 'add_post.dart';

class Addlabtest extends StatefulWidget {
  static String route = "Add_Lab_Test";
  @override
  _AddlabtestState createState() => _AddlabtestState();
}

class _AddlabtestState extends State<Addlabtest> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Container(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("username"),
                ],
              ),
            ),
            ListTile(
              title: Text("All Post"),
              trailing: Icon(Icons.launch),
              onTap: () {},
            ),
            ListTile(
              title: Text("New Story"),
              trailing: Icon(Icons.add),
              onTap: () {},
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text("Feedback"),
              trailing: Icon(Icons.feedback),
              onTap: () {},
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.power_settings_new),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF3D00E0),
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'I am From add lab test appointment',
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
              Navigator.pushNamed(context, Addoctors.route);
            } else if (selectedIndex == 1) {
              Navigator.pushNamed(context, Addlabtest.route);
            } else if (selectedIndex == 2) {
              Navigator.pushNamed(context, AddPost.route);
            }
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Add Doctor',
            selectedBackgroundColor: Color(0xFF3D00E0),
          ),
          FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Add Lab test',
            selectedBackgroundColor: Color(0xFF3D00E0),
          ),
          FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Add Post',
            selectedBackgroundColor: Color(0xFF3D00E0),
          ),
        ],
      ),
    );
  }
}
