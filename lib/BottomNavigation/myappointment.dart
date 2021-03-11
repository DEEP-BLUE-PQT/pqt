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
import 'package:url_launcher/url_launcher.dart';

import 'dialog3.dart';
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

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url, forceWebView: true, forceSafariVC: false)
      : throw 'Could not launch $_url';

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

  callcallcallmyDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) {
        return MyDialog3();
      },
    );
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
        const Duration(minutes: 1), // 5 mins instead of 3s
        (Timer timer1) async {
          if (successcons == 1) {
            await apIservice.read();

            if (successcons == 0) {
              setState(() {
                pcit2;
                pcit3;
                pcotDisplay;
              });
              timer1.cancel();
              startTimer5();
              flagofState = false;
            }
          }
          if (flagofState) {
            setState(
              () {
                newWaitingTime;
                difference = newWaitingTime - oldWaitingTime;
                print(
                    "I am old Time before update " + oldWaitingTime.toString());
                oldWaitingTime = newWaitingTime;
                displayTime = displayTime + difference;
                if (check(displayTime)) {
                  print(
                      "I am new waiting time API " + newWaitingTime.toString());
                  print("I am diff " + difference.toString());
                  print("I am old Time After update " +
                      oldWaitingTime.toString());
                  print("I am display Time  " + displayTime.toString());
                } else {
                  print("I am done here timer 1");
                  timer1.cancel();

                  startTimer5();
                }
              },
            );
          }
        },
      );
    }
  }

  void startTimer5() {
    print("I starttimer 5 was called");
    print("1");
    if (_timer5 != null) {
      _timer5.cancel();
      _timer5 = null;
    } else {
      print("2");
      _timer5 = new Timer.periodic(
        const Duration(minutes: 1), // 5 mins instead of 3s
        (Timer timer5) async {
          print("3");

          await apIservice.readBM();

          if (success == 1) {
            setState(() {
              pcit2;
              pcit3;
              pcotDisplay;
            });
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
                print("filal ke liye 20 sec");
                //needs to be 4 minutes

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
        (Timer timer4) {
          setState(
            () {
              if (wt3 < 1) {
                print("I am done here timer 3");
                //old_waiting<0
                timer4.cancel();
                print("filal ke liye 20 sec");
                //needs to be 6 minutes
                sleep(
                  Duration(minutes: 6),
                );
                flag = false;
                callcallcallmyDialog();
              } else {
                wt3 = wt3 - 1;
                print("I am GENERAL wt2 " + wt3.toString());
                //set state (old_waiting= old_waiting - 1)
              }
            },
          );
        },
      );
    }
  }

  // void startTimer4() {
  //   print("I am startTimer 4");
  //   if (_timer4 != null) {
  //     _timer4.cancel();
  //     _timer4 = null;
  //   } else {
  //     print("4_1");
  //     _timer4 = new Timer.periodic(
  //       const Duration(minutes: 1), // 1 min
  //       (Timer timer4) {
  //         setState(
  //           () {
  //             print("4_2");
  //             if (wt3 < 1) {
  //               print("4_3");
  //               print("I am done here timer 4");
  //               //old_waiting<0
  //               timer4.cancel();
  //               print("filal ke liye 20 sec");
  //               //needs to be 4 minutes
  //
  //               sleep(
  //                 Duration(seconds: 20),
  //               );
  //             } else {
  //               print("4_4");
  //               wt3 = wt3 - 1;
  //               print("I am GENERAL wt3 " + wt3.toString());
  //               //set state (old_waiting= old_waiting - 1)
  //             }
  //           },
  //         );
  //       },
  //     );
  //   }
  // }

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
        actions: [
          IconButton(
            icon: Icon(Icons.add_call),
            color: 1 == 1 ? Colors.white : Colors.white54,
            onPressed: () {
              launch("tel://+919004958891");
            },
            iconSize: 35,
          ),
          IconButton(
            icon: Icon(Icons.app_blocking_rounded),
            color: 1 == 1 ? Colors.white : Colors.white54,
            onPressed: () {
              // ignore: unnecessary_statements
              launchURL('https://clever-mcclintock-4601aa.netlify.app');
              print("here");
            },
            iconSize: 35,
          ),
        ],
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
                      child: Text(
                        'Appointment History',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF3D00E0),
                ),
              ),
            ),
            Expanded(
              //name --> leading
              //doctor --> title
              //subtitle --> depname +'\n' + slot time
              //trailing --> date

              child: ListView.builder(
                padding: EdgeInsets.only(top: 0.0),
                itemCount: history == null ? 0 : history.length,
                itemBuilder: (context, index) {
                  return Ink(
                    color: true ? Colors.white : null,
                    child: ListTile(
                      title: Text(
                        history[index]["docName"],
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(history[index]["depName"] +
                          " " +
                          history[index]["starttime"] +
                          "-" +
                          history[index]["endtime"]),
                      leading: Text(
                        history[index]["name"],
                      ),
                      trailing: Text(
                        history[index]["dateChoosen"],
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
