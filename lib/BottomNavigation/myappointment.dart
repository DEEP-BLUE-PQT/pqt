import 'dart:async';
import 'dart:io';

import 'package:cron/cron.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/post.dart';
import 'package:flutter_app_pqt_splash/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation.dart';

class Myappointment extends StatefulWidget {
  static String route = "Myappointment";
  @override
  _MyappointmentState createState() => _MyappointmentState();
}

class _MyappointmentState extends State<Myappointment> {
  APIservice apIservice = APIservice();
  bool check(int value) {
    if (value > 0) {
      return true;
    } else {
      displayTime = 0;
      return false;
    }
  }

  getHistory() async {
    await apIservice.getHistory();
  }

  @override
  void initState() {
    getHistory();
  }

  callmyAPI() async {
    await apIservice.readBM();
  }

  Timer _timer1;
  Timer _timer2;
  Timer _timer3;
  Timer _timer4;
  Timer _timer5;

  void startTimer() {
    print("I starttimer was called");
    if (_timer1 != null) {
      _timer1.cancel();
      _timer1 = null;
    } else {
      _timer1 = new Timer.periodic(
        const Duration(minutes: 2), // 5 mins instead of 3s
        (Timer timer1) async {
          if (successcons == 1) {
            await apIservice.read();
            if (successcons == 0) {
              timer1.cancel();
              startTimer5();
            }
          }

          setState(
            () {
              newWaitingTime;
              difference = newWaitingTime - oldWaitingTime;
              print("I am old Time before update " + oldWaitingTime.toString());
              oldWaitingTime = newWaitingTime;
              displayTime = displayTime + difference;
              if (check(displayTime)) {
                print("I am new waiting time API " + newWaitingTime.toString());
                print("I am diff " + difference.toString());
                print(
                    "I am old Time After update " + oldWaitingTime.toString());
                print("I am display Time  " + displayTime.toString());
              } else {
                print("I am done here timer 1");
                timer1.cancel();

                startTimer5();
              }
            },
          );
        },
      );
    }
  }

  void startTimer5() {
    print("I starttimer 5 was called");
    if (_timer5 != null) {
      _timer5.cancel();
      _timer5 = null;
    } else {
      _timer5 = new Timer.periodic(
        const Duration(minutes: 1), // 5 mins instead of 3s
        (Timer timer5) async {
          await apIservice.readBM();
          if (success == 1) {
            timer5.cancel();

            startTimer3();
          }
        },
      );
    }
  }

  void startTimer2() {
    print("I am startTimer2");
    if (_timer2 != null) {
      _timer2.cancel();
      _timer2 = null;
    } else {
      _timer2 = new Timer.periodic(
        const Duration(seconds: 55), // 1 min
        (Timer timer2) {
          setState(
            () {
              if (displayTime < 1) {
                print("I am done here timer2");
                displayTime;
                //old_waiting<0
                timer2.cancel();
              } else {
                displayTime = displayTime - 1;
                print("I am GENERAL displayTime " + displayTime.toString());
                //set state (old_waiting= old_waiting - 1)
              }
            },
          );
        },
      );
    }
  }

  void startTimer3() {
    print("I am startTimer 3");
    if (_timer3 != null) {
      _timer3.cancel();
      _timer3 = null;
    } else {
      _timer3 = new Timer.periodic(
        const Duration(minutes: 1), // 1 min
        (Timer timer3) {
          setState(
            () {
              if (wt2 < 1) {
                print("I am done here timer 3");
                //old_waiting<0
                timer3.cancel();
                sleep(
                  Duration(minutes: 4),
                );
                startTimer4();
              } else {
                wt2 = wt2 - 1;
                print("I am GENERAL wt2 " + wt2.toString());
                //set state (old_waiting= old_waiting - 1)
              }
            },
          );
        },
      );
    }
  }

  void startTimer4() {
    print("I am startTimer 4");
    if (_timer4 != null) {
      _timer4.cancel();
      _timer4 = null;
    } else {
      _timer4 = new Timer.periodic(
        const Duration(minutes: 1), // 1 min
        (Timer timer3) {
          setState(
            () {
              if (wt3 < 1) {
                print("I am done here timer 4");
                //old_waiting<0
                timer3.cancel();
              } else {
                wt3 = wt3 - 1;
                print("I am GENERAL wt3 " + wt3.toString());
                //set state (old_waiting= old_waiting - 1)
              }
            },
          );
        },
      );
    }
  }

  void Display_wt1() {
    print("I cron was called");
    var cron = new Cron();
    cron.schedule(new Schedule.parse(scheduler), () async {
      print("I am here");
      startTimer();
      startTimer2();
    });
  }

  @override
  void dispose() {
    _timer2.cancel();
    super.dispose();
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    if (dispTorF) {
      Display_wt1();
      dispTorF = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: Container(),
        backgroundColor: Color(0xFF3D00E0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "My Appointment",
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text('Appointment History'),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 0.0),
                itemCount: dataHistory == null ? 0 : dataHistory.length,
                itemBuilder: (context, index) {
                  return Ink(
                    color: true ? Colors.blueGrey : null,
                    child: ListTile(
                      title: Text(dataHistory[index][1],
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text('My City, CA 99984'),
                      leading: Icon(
                        Icons.restaurant_menu,
                        color: Colors.blue[500],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: Expanded(
      //     child: SingleChildScrollView(
      //       child: ListView(
      //         padding: EdgeInsets.zero,
      //         children: <Widget>[
      //           Container(
      //             height: 100,
      //             child: DrawerHeader(
      //               child: Text(
      //                 'Previous and Future records',
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //               decoration: BoxDecoration(
      //                 color: Color(0xFF3D00E0),
      //               ),
      //             ),
      //           ),
      //           Container(
      //               height: double.maxFinite,
      //               child: ListView.builder(
      //                   itemCount: data == null ? 0 : data.length,
      //                   itemBuilder: (BuildContext context, i) {
      //                     return new ListTile(
      //                       title: Text(data[i]),
      //                     );
      //                   }))
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: flag
          ? ExpandableTheme(
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
                                          color: Color(0xFF3D00E0),
                                          fontSize: 15),
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
                                          subtitle:
                                              Text('check-in-time : ' + pcit1),
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
                                          subtitle:
                                              Text('check-in-time : ' + pcit2),
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
                                          subtitle:
                                              Text('check-in-time : ' + pcit3),
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
            )
          : Center(
              child: Container(
                child: Center(
                  child: Text(
                    "No Appointment",
                    style: GoogleFonts.alike(
                      fontSize: 25,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
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
