// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:expandable/expandable.dart';
//
// class ExpandableCard extends StatefulWidget {
//   @override
//   _ExpandableCardState createState() => _ExpandableCardState();
// }
//
// class _ExpandableCardState extends State<ExpandableCard> {
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableTheme(
//         data: const ExpandableThemeData(
//           iconColor: Color(0xFF3D00E0),
//           useInkWell: true,
//         ),
//         child: ListView(
//             physics: const BouncingScrollPhysics(),
//             children: <Widget>[Card1(), Card2()]));
//   }
// }
//
// class Card1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Card(
//         color: Colors.blue[100],
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           children: <Widget>[
//             ListTile(
//                 title: Text(
//                   'Dr. Charusheela  vhgjd',
//                 ),
//                 subtitle: Text(
//                   'Pediatrician\ncheck-in-time : 5:00 pm',
//                 )),
//             ScrollOnExpand(
//               scrollOnExpand: true,
//               scrollOnCollapse: false,
//               child: ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToCollapse: true,
//                 ),
//                 header: Container(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       "WAITING TIME",
//                       style: TextStyle(color: Color(0xFF3D00E0), fontSize: 15),
//                     )),
//                 /*collapsed: Text(
//                       loremIpsum,
//                       softWrap: true,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),*/
//                 expanded: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 2,
//                       color: Color(0xFF3D00E0),
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Card(
//                       color: Colors.deepPurpleAccent[50],
//                       child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             ListTile(
//                               title: Text('Registration Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                             Divider(
//                               color: Color(0xFF3D00E0),
//                               thickness: 2,
//                             ),
//                             ListTile(
//                               title: Text('Consultation Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                             Divider(
//                               color: Color(0xFF3D00E0),
//                               thickness: 2,
//                             ),
//                             ListTile(
//                               title: Text('Billing Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                             Divider(
//                               color: Color(0xFF3D00E0),
//                               thickness: 2,
//                             ),
//                             ListTile(
//                               title: Text('Medicine Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                           ])),
//                 ),
//                 builder: (_, collapsed, expanded) {
//                   return Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Expandable(
//                       collapsed: collapsed,
//                       expanded: expanded,
//                       theme: const ExpandableThemeData(crossFadePoint: 0),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
//
// class Card2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ExpandableNotifier(
//         child: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Card(
//         color: Colors.blue[100],
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           children: <Widget>[
//             ListTile(
//                 title: Text(
//                   'Dr. Rajeev  vhgjd',
//                 ),
//                 subtitle: Text(
//                   'Pediatrician\ncheck-in-time : 5:00 pm',
//                 )),
//             ScrollOnExpand(
//               scrollOnExpand: true,
//               scrollOnCollapse: false,
//               child: ExpandablePanel(
//                 theme: const ExpandableThemeData(
//                   headerAlignment: ExpandablePanelHeaderAlignment.center,
//                   tapBodyToCollapse: true,
//                 ),
//                 header: Container(
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       "WAITING TIME",
//                       style: TextStyle(color: Color(0xFF3D00E0), fontSize: 15),
//                     )),
//                 /*collapsed: Text(
//                       loremIpsum,
//                       softWrap: true,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),*/
//                 expanded: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 2,
//                       color: Color(0xFF3D00E0),
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Card(
//                       color: Colors.deepPurpleAccent[50],
//                       child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             ListTile(
//                               title: Text('Registration Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                             Divider(
//                               color: Color(0xFF3D00E0),
//                               thickness: 2,
//                             ),
//                             ListTile(
//                               title: Text('Consultation Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                             Divider(
//                               color: Color(0xFF3D00E0),
//                               thickness: 2,
//                             ),
//                             ListTile(
//                               title: Text('Billing Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                             Divider(
//                               color: Color(0xFF3D00E0),
//                               thickness: 2,
//                             ),
//                             ListTile(
//                               title: Text('Medicine Queue'),
//                               subtitle: Text('check-in-time : 5:00'),
//                               trailing: Text('20 mins'),
//                             ),
//                           ])),
//                 ),
//                 builder: (_, collapsed, expanded) {
//                   return Padding(
//                     padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
//                     child: Expandable(
//                       collapsed: collapsed,
//                       expanded: expanded,
//                       theme: const ExpandableThemeData(crossFadePoint: 0),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
