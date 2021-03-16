// import 'dart:async';
// import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
//
// class multipleAppointment {
//   bool check(int value) {
//     if (value > 0) {
//       return true;
//     } else {
//       displayTime = 0;
//       return false;
//     }
//   }
//
//   APIservice apIservice = APIservice();
//   int successcons;
//   String pcit2;
//   String pcit3;
//   String pcotDisplay;
//   bool flagofState = false;
//   int newWaitingTime;
//   int oldWaitingTime;
//   int displayTime;
//
//   int difference; //local
//
//   multipleAppointment({
//     this.successcons,
//     this.pcit3,
//     this.pcit2,
//     this.pcotDisplay,
//     this.flagofState,
//     this.oldWaitingTime,
//     this.displayTime,
//     this.newWaitingTime,
//   });
//
//   Timer _timer1;
//   Timer _timer2;
//   Timer _timer3;
//   Timer _timer4;
//   Timer _timer5;
//
//   //UI
//   //obj.starttime()
//   //
//
//   //obj.pcot2
//
//   void startTimer() {
//     print("I starttimer was called");
//     if (_timer1 != null) {
//       _timer1.cancel();
//       _timer1 = null;
//     } else {
//       _timer1 = new Timer.periodic(
//         const Duration(minutes: 1), // 5 mins instead of 3s
//         (Timer timer1) async {
//           if (successcons == 1) {
//             await apIservice.read();
//
//             if (successcons == 0) {
//               // setState(() {
//               //   pcit2;
//               //   pcit3;
//               //   pcotDisplay;
//               // });
//               timer1.cancel();
//               startTimer5();
//               flagofState = false;
//             }
//           }
//           if (flagofState) {
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
//               print("I am done here timer 1");
//               timer1.cancel();
//
//               startTimer5();
//             }
//           }
//         },
//       );
//     }
//   }
//
//   void startTimer5() {
//     print("I starttimer 5 was called");
//     print("1");
//     if (_timer5 != null) {
//       _timer5.cancel();
//       _timer5 = null;
//     } else {
//       print("2");
//       _timer5 = new Timer.periodic(
//         const Duration(minutes: 1), // 5 mins instead of 3s
//         (Timer timer5) async {
//           print("3");
//
//           await apIservice.readBM();
//
//           if (success == 1) {
//             timer5.cancel();
//
//             startTimer3();
//           }
//         },
//       );
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
//         const Duration(seconds: 55), // 1 min
//         (Timer timer2) {
//           setState(
//             () {
//               if (displayTime < 1) {
//                 print("I am done here timer2");
//                 displayTime;
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
//                 print("filal ke liye 20 sec");
//                 //needs to be 4 minutes
//
//                 sleep(
//                   Duration(minutes: 1),
//                 );
//                 startTimer4();
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
//   void startTimer4() {
//     print("I am startTimer 4");
//     if (_timer4 != null) {
//       _timer4.cancel();
//       _timer4 = null;
//     } else {
//       _timer4 = new Timer.periodic(
//         const Duration(minutes: 1), // 1 min
//         (Timer timer4) {
//           setState(
//             () {
//               if (wt3 < 1) {
//                 print("I am done here timer 3");
//                 //old_waiting<0
//                 timer4.cancel();
//                 print("filal ke liye 20 sec");
//                 //needs to be 6 minutes
//                 sleep(
//                   Duration(minutes: 1),
//                 );
//                 flag = false;
//                 callcallcallmyDialog();
//               } else {
//                 wt3 = wt3 - 1;
//                 print("I am GENERAL wt2 " + wt3.toString());
//                 //set state (old_waiting= old_waiting - 1)
//               }
//             },
//           );
//         },
//       );
//     }
//   }
//
//   // void startTimer4() {
//   //   print("I am startTimer 4");
//   //   if (_timer4 != null) {
//   //     _timer4.cancel();
//   //     _timer4 = null;
//   //   } else {
//   //     print("4_1");
//   //     _timer4 = new Timer.periodic(
//   //       const Duration(minutes: 1), // 1 min
//   //       (Timer timer4) {
//   //         setState(
//   //           () {
//   //             print("4_2");
//   //             if (wt3 < 1) {
//   //               print("4_3");
//   //               print("I am done here timer 4");
//   //               //old_waiting<0
//   //               timer4.cancel();
//   //               print("filal ke liye 20 sec");
//   //               //needs to be 4 minutes
//   //
//   //               sleep(
//   //                 Duration(seconds: 20),
//   //               );
//   //             } else {
//   //               print("4_4");
//   //               wt3 = wt3 - 1;
//   //               print("I am GENERAL wt3 " + wt3.toString());
//   //               //set state (old_waiting= old_waiting - 1)
//   //             }
//   //           },
//   //         );
//   //       },
//   //     );
//   //   }
//   // }
//
//   void Display_wt1() {
//     print("I cron was called");
//     var cron = new Cron();
//     cron.schedule(new Schedule.parse(scheduler), () async {
//       print("I am here");
//       startTimer();
//       startTimer2();
//     });
//   }
// }
