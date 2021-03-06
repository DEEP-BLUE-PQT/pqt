import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/makeappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/post.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'makeappointment2follower.dart';

class Bnavigation extends StatefulWidget {
  static String route = "Bnavigation";
  @override
  _BnavigationState createState() => _BnavigationState();
}

class _BnavigationState extends State<Bnavigation> {
  APIservice apIservice = APIservice();
  final editingController = new TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: Color(0xFF3D00E0),
        title: Text("Doctors List"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: editingController,
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctorList == null ? 0 : doctorList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      dateChoosen = null;
                      slotChoosen = null;
                      docId = doctorList[index]['docid'].toString();
                      await apIservice.getDates();
                      setState(() {
                        docId = doctorList[index]['docid'].toString();
                        docName = doctorList[index]['docname'];
                        depName = doctorList[index]['depname'];
                        // slots = newSlotMap[docName];

                        Navigator.pushNamed(context, MakeAppointment.route);
                        //TODO SLOT KESE KRNA H
                        //  Navigator.push(
                        //    context,
                        //    MaterialPageRoute(builder: (context) => Main2()),
                        //  );
                      });
                    },
                    child: ListTile(
                      title: Text(
                        doctorList[index]["docname"].toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17.0,
                        ),
                      ),
                      subtitle: Text(
                        doctorList[index]["depname"].toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12.0,
                        ),
                      ),
                      leading: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 40.0,
                      ),
                    ),

                    // child: Row(
                    //   children: [
                    //     Icon(
                    //       Icons.person,
                    //       color: Colors.grey,
                    //       size: 40.0,
                    //     ),
                    //     SizedBox(
                    //       width: 10.0,
                    //     ),
                    //     Center(
                    //       child: Container(
                    //         height: 80.0,
                    //         child: Center(
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Text(
                    //                 doctorList[index]["docname"]
                    //                     .toString()
                    //                     .toUpperCase(),
                    //                 style: TextStyle(
                    //                   color: Colors.blue,
                    //                   fontSize: 19.0,
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 10.0,
                    //               ),
                    //               Text(
                    //                 doctorList[index]["depname"]
                    //                     .toString()
                    //                     .toUpperCase(),
                    //                 style: TextStyle(
                    //                   color: Colors.blue,
                    //                   fontSize: 12.0,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  );
                },
              ),
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
