import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'appointmentHistory.dart';
import 'navigation.dart';

class Post extends StatefulWidget {
  static String route = "Post";
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  APIservice apIservice = APIservice();

  getPostList() async {
    await apIservice.getPosts();
  }

  @override
  void initState() {
    getPostList();
    // getSlotsList();
  }

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
      body: flag1
          ? Container(
              height: double.maxFinite,
              child: ListView.builder(
                  itemCount: PostData == null ? 0 : PostData.length,
                  itemBuilder: (BuildContext context, i) {
                    return new ListTile(
                      title: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black12),
                          ),
                        ),
                        child: Text(
                          PostData[i],
                          style: GoogleFonts.alike(color: Colors.black),
                        ),
                      ),
                    );
                  }))
          : Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Center(child: Text("No post available")),
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, spreadRadius: 3),
                      ],
                    ),
                  ),
                ),
              ],
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
            } else if (selectedIndex == 3) {
              Navigator.pushNamed(context, AppointmentHistory.route);
            }
          });
        },
        items: items,
      ),
    );
  }
}
