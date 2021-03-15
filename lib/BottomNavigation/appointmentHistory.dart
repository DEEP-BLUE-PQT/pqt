import 'package:expandable/expandable.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/post.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'myappointment.dart';
import 'navigation.dart';

class AppointmentHistory extends StatefulWidget {
  static String route = "AppointmentHistory";
  @override
  _AppointmentHistoryState createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: Color(0xFF3D00E0),
        title: Text("Appointment History"),
      ),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Color(0xFF3D00E0),
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            // Card1(),
            ExpandableNotifier(
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
                              dateChoosen +
                              '\n' +
                              "Doctor check in time " +
                              pcit1,
                        ),
                      ),
                      ScrollOnExpand(
                        scrollOnExpand: true,
                        scrollOnCollapse: false,
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                            headerAlignment:
                                ExpandablePanelHeaderAlignment.center,
                            tapBodyToCollapse: true,
                          ),
                          header: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "WAITING TIME",
                                style: TextStyle(
                                    color: Color(0xFF3D00E0), fontSize: 15),
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
                                    subtitle: Text('check-in-time : ' + pcit1),
                                    trailing: Text(
                                      displayTime.toString() +
                                          "  " +
                                          "+/- " +
                                          error +
                                          ' ' +
                                          'mins',
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFF3D00E0),
                                    thickness: 2,
                                  ),
                                  ListTile(
                                    title: Text('Billing Queue'),
                                    subtitle: Text('check-in-time : ' + pcit2),
                                    trailing: Text(
                                      wt2.toString() +
                                          "  " +
                                          "+/- " +
                                          "3" +
                                          ' ' +
                                          'mins',
                                    ),
                                  ),
                                  Divider(
                                    color: Color(0xFF3D00E0),
                                    thickness: 2,
                                  ),
                                  ListTile(
                                    title: Text('Medicine Queue'),
                                    subtitle: Text('check-in-time : ' +
                                        pcit3 +
                                        '\n' +
                                        '\n' +
                                        'check-out-time :' +
                                        pcotDisplay),
                                    trailing: Text(
                                      wt3.toString() +
                                          "  " +
                                          "+/- " +
                                          "5" +
                                          ' ' +
                                          'mins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          builder: (_, collapsed, expanded) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: Expandable(
                                collapsed: collapsed,
                                expanded: expanded,
                                theme: const ExpandableThemeData(
                                    crossFadePoint: 0),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
