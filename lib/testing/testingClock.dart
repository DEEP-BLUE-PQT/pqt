// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:cron/cron.dart';
// import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
// import 'package:flutter_app_pqt_splash/constants.dart';
//
// void main() {
//   int old_waiting;
//   int new_waiting;
//   runApp(
//     MaterialApp(
//       home: MyWidget(),
//     ),
//   );
// }
//
// class MyWidget extends StatefulWidget {
//   State createState() => new _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   bool check(int value) {
//     if (value > 0) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   callmyAPI() async {
//     await apIservice.test2();
//   }
//
//   APIservice apIservice = APIservice();
//   Timer _timer1;
//   Timer _timer2;
//   Timer _timer3;
//   int _start2 = 5;
//
//   void startTimer() {
//     print("I am startTimer1");
//     if (_timer1 != null) {
//       _timer1.cancel();
//       _timer1 = null;
//     } else {
//       _timer1 =
//           new Timer.periodic(const Duration(minutes: 2), // 5 mins instead of 3s
//               (Timer timer1) async {
//         await apIservice.test();
//         setState(
//           () {
//             newWaitingTime;
//             difference = newWaitingTime - oldWaitingTime;
//             print("I am old Time before update " + oldWaitingTime.toString());
//             oldWaitingTime = newWaitingTime;
//             displayTime = displayTime + difference;
//             if (check(displayTime)) {
//               print("I am new waiting time API " + newWaitingTime.toString());
//               print("I am diff " + difference.toString());
//               print("I am old Time After update " + oldWaitingTime.toString());
//               print("I am display Time  " + displayTime.toString());
//             } else {
//               print("I am done here timer1");
//               timer1.cancel();
//               callmyAPI();
//               startTimer3();
//             }
//
//             // startTimer2();
//             // set state(
//             // new_waiting = res from api
//             // difference = new_waiting - old_waiting
//             // old_waiting = old_waiting + difference
//             //)
//           },
//         );
//       });
//     }
//   }
//
//   void startTimer2() {
//     print("I am startTimer2");
//     if (_timer2 != null) {
//       _timer2.cancel();
//       _timer2 = null;
//     } else {
//       _timer2 = new Timer.periodic(
//         const Duration(minutes: 1), // 1 min
//         (Timer timer2) {
//           setState(
//             () {
//               if (displayTime < 1) {
//                 print("I am done here timer2");
//                 //old_waiting<0
//                 timer2.cancel();
//               } else {
//                 displayTime = displayTime - 1;
//                 print("I am GENERAL displayTime " + displayTime.toString());
//                 //set state (old_waiting= old_waiting - 1)
//               }
//             },
//           );
//         },
//       );
//     }
//   }
//
//   void startTimer3() {
//     print("I am startTimer 3");
//     if (_timer3 != null) {
//       _timer3.cancel();
//       _timer3 = null;
//     } else {
//       _timer3 = new Timer.periodic(
//         const Duration(minutes: 1), // 1 min
//         (Timer timer3) {
//           setState(
//             () {
//               if (wt2 < 1) {
//                 print("I am done here timer 3");
//                 //old_waiting<0
//                 timer3.cancel();
//               } else {
//                 wt2 = wt2 - 1;
//                 print("I am GENERAL wt2 " + wt2.toString());
//                 //set state (old_waiting= old_waiting - 1)
//               }
//             },
//           );
//         },
//       );
//     }
//   }
//
//   void Display_wt1() {
//     print("I cron was called");
//     var cron = new Cron();
//     cron.schedule(new Schedule.parse('05 01 17 2 *'), () async {
//       startTimer();
//       startTimer2();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer2.cancel();
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(title: Text("Timer test")),
//       body: Column(
//         children: <Widget>[
//           RaisedButton(
//             onPressed: () {
//               print("I was pressed");
//               Display_wt1();
//             },
//             child: Text("start"),
//           ),
//           Column(
//             children: [
//               Text("I am from consul ===>                  " + "$displayTime"),
//               SizedBox(height: 10.0),
//               Text("I am from wt2 ===>                      " + "$wt2"),
//               SizedBox(height: 10.0),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
