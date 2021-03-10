// import 'dart:async';
//
// import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
//
// class CronTimer{
//   APIservice apIservice = APIservice();
//   Timer _timer1;
//   Timer _timer2;
//   Timer _timer3;
//   Timer _timer4;
//   Timer _timer5;
//   int successcons;
//   String patientId;
//   String docId;
//   String slotId;
//   String dateChoosen;
//
//
//   CronTimer({
//     this.successcons,
//     this.patientId,
//     this.docId,
//     this.slotId,
//     this.dateChoosen
// });
//
//   void startTimer() {
//     print("I starttimer was called");
//     if (_timer1 != null) {
//       _timer1.cancel();
//       _timer1 = null;
//     } else {
//       _timer1 = new Timer.periodic(
//         const Duration(minutes: 1), // 5 mins instead of 3s
//             (Timer timer1) async {
//           if (successcons == 1) {
//             await apIservice.read(patientId , docId , slotId , dateChoosen);
//
//             if (successcons == 1) {
//               setState(() {
//                 pcit2;
//                 pcit3;
//                 pcotDisplay;
//               });
//               timer1.cancel();
//               startTimer5();
//               flagofState = false;
//             }
//           }
//           if (flagofState) {
//             setState(
//                   () {
//                 newWaitingTime;
//                 difference = newWaitingTime - oldWaitingTime;
//                 print(
//                     "I am old Time before update " + oldWaitingTime.toString());
//                 oldWaitingTime = newWaitingTime;
//                 displayTime = displayTime + difference;
//                 if (check(displayTime)) {
//                   print(
//                       "I am new waiting time API " + newWaitingTime.toString());
//                   print("I am diff " + difference.toString());
//                   print("I am old Time After update " +
//                       oldWaitingTime.toString());
//                   print("I am display Time  " + displayTime.toString());
//                 } else {
//                   print("I am done here timer 1");
//                   timer1.cancel();
//
//                   startTimer5();
//                 }
//               },
//             );
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
//             (Timer timer5) async {
//           print("3");
//
//           await apIservice.readBM();
//
//           if (success == 1) {
//             setState(() {
//               pcit2;
//               pcit3;
//               pcotDisplay;
//             });
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
//             (Timer timer2) {
//           setState(
//                 () {
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
//             (Timer timer3) {
//           setState(
//                 () {
//               if (wt2 < 1) {
//                 print("I am done here timer 3");
//                 //old_waiting<0
//                 timer3.cancel();
//                 print("filal ke liye 20 sec");
//                 //needs to be 4 minutes
//
//                 sleep(
//                   Duration(minutes: 4),
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
//             (Timer timer4) {
//           setState(
//                 () {
//               if (wt3 < 1) {
//                 print("I am done here timer 3");
//                 //old_waiting<0
//                 timer4.cancel();
//                 print("filal ke liye 20 sec");
//                 //needs to be 6 minutes
//                 sleep(
//                   Duration(minutes: 6),
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
//
//
//
//
//
//
//
// }
