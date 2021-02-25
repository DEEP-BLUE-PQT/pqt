import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../constants.dart';
import 'dialog.dart';
import 'dialog2.dart';
import 'myappointment.dart';
import 'navigation.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MakeAppointment extends StatefulWidget {
  static String route = 'Makeappointment';
  @override
  _MakeAppointmentState createState() => _MakeAppointmentState();
}
//REGION HI SLOT H

class _MakeAppointmentState extends State<MakeAppointment> {
  APIservice apIservice = APIservice();

  getSlots() async {
    await apIservice.getSlots();
  }

  _onBasicAlertPressed3(context) {
    Alert(
      style: AlertStyle(
        isButtonVisible: false,
        isCloseButton: true,
        backgroundColor: Colors.white,
      ),
      context: context,
      title: "Please Select Slot",
    ).show();
  }

  _onBasicAlertPressed1(context) {
    Alert(
      style: AlertStyle(
        isButtonVisible: false,
        isCloseButton: true,
        backgroundColor: Colors.white,
      ),
      context: context,
      title: message,
    ).show();
  }

  _onBasicAlertPressed2(context) {
    Alert(
      style: AlertStyle(
        isButtonVisible: false,
        isCloseButton: true,
        backgroundColor: Colors.white,
      ),
      context: context,
      title: message,
    ).show();
  }

  String selectedRegion;

  int _value = null;
  int _gendervalue = null;

  @override
  void initState() {
    getData();
  }

  final userName = new TextEditingController();
  final userContact = new TextEditingController();
  final userEmail = new TextEditingController();
  final userAge = new TextEditingController();
  final userGender = new TextEditingController();

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName.text = prefs.getString("userName");
      userContact.text = prefs.getString("userContact");
      userEmail.text = prefs.getString("userEmail");
      userAge.text = prefs.getString("userAge");
      userGender.text = prefs.getString("userGender");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D00E0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFF3D00E0),
              height: 135,
              width: 380,
              child: Center(
                child: Row(
                  children: [
                    FlatButton.icon(
                      label: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Bnavigation.route);
                      },
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(docName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                          Text(depName,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ]),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Center(
                  //     heightFactor: 0.01,
                  //     child: Container(
                  //       child: ListTile(
                  //         dense: true,
                  //         leading: Text('DATE',
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.w500,
                  //                 color: Color(0xFF3D00E0))),
                  //       ),
                  //     )),
                  Center(
                    child: Container(
                      child: ListTile(
                        dense: true,
                        leading: Text(
                          'DATE',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3D00E0),
                          ),
                        ),
                        trailing: DropdownButton(
                          hint: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Select Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          items: datesList.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          value: dateChoosen,
                          onChanged: (newValue) async {
                            setState(
                              () {
                                dateChoosen = newValue;
                              },
                            );
                            await getSlots();
                            setState(() {
                              slotnew;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: ListTile(
                        dense: true,
                        leading: Text(
                          'SLOTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3D00E0),
                          ),
                        ),
                        trailing: DropdownButton(
                          hint: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Select Slot",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          items: slotnew.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                          value: slotChoosen,
                          onChanged: (newValue) async {
                            setState(
                              () {
                                slotChoosen = newValue;
                                slotId = slot[slotChoosen];
                                print(slotId);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Center(
                  //     child: Container(
                  //   child: ListTile(
                  //     dense: true,
                  //     leading: Text(
                  //       'TIME',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         color: Color(0xFF3D00E0),
                  //       ),
                  //     ),
                  //     trailing: DropdownButton<String>(
                  //       value: selectedRegion,
                  //       isDense: true,
                  //       hint: Align(
                  //         alignment: Alignment.centerRight,
                  //         child: Text(
                  //           "Select Slot",
                  //           style: TextStyle(color: Colors.grey),
                  //         ),
                  //       ),
                  //       items: _region.map((Region map) {
                  //         return new DropdownMenuItem<String>(
                  //           value: map.slotid.toString(),
                  //           child: new Text('${map.time}',
                  //               style: new TextStyle(color: Colors.black)),
                  //         );
                  //       }).toList(),
                  //       onChanged: (String newValue) {
                  //         setState(() {
                  //           selectedRegion = newValue;
                  //           // print(selectedRegion);
                  //           slotId = selectedRegion.toString();
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // )),
                  Center(
                    child: Card(
                        shadowColor: Color(0xFF3D00E0),
                        child: Column(
                          children: [
                            ListTile(
                              dense: true,
                              leading: Text(
                                'NAME',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF3D00E0)),
                              ),
                              trailing: Text(
                                userName.text,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Divider(
                              color: Color(0xFF3D00E0),
                            ),
                            ListTile(
                              dense: true,
                              leading: Text('AGE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF3D00E0))),
                              trailing: Text(
                                userAge.text,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Divider(color: Color(0xFF3D00E0)),
                            ListTile(
                              dense: true,
                              leading: Text(
                                'GENDER',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3D00E0),
                                ),
                              ),
                              trailing: Text(
                                userGender.text,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Divider(
                              color: Color(0xFF3D00E0),
                            ),
                            ListTile(
                              dense: true,
                              leading: Text(
                                'PHONE NO.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3D00E0),
                                ),
                              ),
                              trailing: Text(
                                userContact.text,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Center(
                    child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          ButtonTheme(
                            minWidth: 100.0,
                            height: 50.0,
                            child: RaisedButton(
                              color: Color(0xFF3D00E0),
                              child: Text(
                                'EDIT DETAILS',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                final result = await showDialog<bool>(
                                  context: context,
                                  builder: (_) {
                                    return MyDialog();
                                  },
                                );
                                if (result) {
                                  setState(() {});
                                }
                              },
                            ), //on pressed
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Color(0xFF3D00E0),
                                  width: 5.0,
                                )),
                          ),
                          ButtonTheme(
                            minWidth: 100.0,
                            height: 50.0,
                            child: RaisedButton(
                              color: Colors.red,
                              child: Text(
                                'BOOK APPOINTMENT',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (slotId == null) {
                                } else {
                                  flag = true;

                                  APIservice apIservice = APIservice();
                                  await apIservice.getServiceTime();
                                  await apIservice.getEntry();
                                  if (trueorfalse == "True") {
                                    //todo see alert
                                    dispTorF = true;
                                    final result = await showDialog<bool>(
                                      context: context,
                                      builder: (_) {
                                        return MyDialog2();
                                      },
                                    );
                                    if (result) {
                                      setState(() {});
                                    }
                                    // Navigator.pushNamed(
                                    //     context, Myappointment.route);
                                  } else if (trueorfalse == "False") {
                                    _onBasicAlertPressed2(context);
                                  }
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: Colors.red,
                                    width: 5.0,
                                  )),
                            ),
                          ),
                        ])),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
