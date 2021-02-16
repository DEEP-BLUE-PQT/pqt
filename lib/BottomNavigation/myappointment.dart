import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/post.dart';
import 'package:flutter_app_pqt_splash/constants.dart';

import 'navigation.dart';

class Myappointment extends StatefulWidget {
  static String route = "Myappointment";
  @override
  _MyappointmentState createState() => _MyappointmentState();
}

class _MyappointmentState extends State<Myappointment> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Color(0xFF3D00E0),
        title: Center(child: Text("Make Appointment")),
      ),
      body: flag
          ? ExpandableTheme(
              data: const ExpandableThemeData(
                iconColor: Color(0xFF3D00E0),
                useInkWell: true,
              ),
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[Card1()]))
          : Container(
              child: Text("here"),
              //todo add something
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
            label: 'Make Appointment',
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

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.blue[100],
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text(
                  docName,
                ),
                subtitle: Text(
                  depName +
                      '\n' +
                      "Doctor check in time " +
                      timee.split('-')[0],
                )),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "WAITING TIME",
                      style: TextStyle(color: Color(0xFF3D00E0), fontSize: 15),
                    )),
                /*collapsed: Text(
                      loremIpsum,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),*/
                expanded: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Color(0xFF3D00E0),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Card(
                      color: Colors.deepPurpleAccent[50],
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text('Consultation Queue'),
                              subtitle: Text('check-in-time : 5:00'),
                              trailing: Text(return1),
                            ),
                            Divider(
                              color: Color(0xFF3D00E0),
                              thickness: 2,
                            ),
                            ListTile(
                              title: Text('Billing Queue'),
                              subtitle: Text('check-in-time : 5:00'),
                              trailing: Text('20 mins'),
                            ),
                            Divider(
                              color: Color(0xFF3D00E0),
                              thickness: 2,
                            ),
                            ListTile(
                              title: Text('Medicine Queue'),
                              subtitle: Text('check-in-time : 5:00'),
                              trailing: Text('20 mins'),
                            ),
                          ])),
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
