import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../constants.dart';
import 'dialog.dart';

class MakeAppointment extends StatefulWidget {
  static String route = 'Makeappointment';
  @override
  _MakeAppointmentState createState() => _MakeAppointmentState();
}
//REGION HI SLOT H

class _MakeAppointmentState extends State<MakeAppointment> {
  String data = jsonEncode(slots);
  List<Region> _region = [];
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
    final json = JsonDecoder().convert(data);
    _region = (json).map<Region>((item) => Region.fromJson(item)).toList();
    // selectedRegion = _region[0].time;

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
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(docName,
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                      Text(depName,
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                    ]),
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
                        'TIME',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3D00E0),
                        ),
                      ),
                      trailing: DropdownButton<String>(
                        value: selectedRegion,
                        isDense: true,
                        hint: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Select Slot",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        items: _region.map((Region map) {
                          return new DropdownMenuItem<String>(
                            value: map.slotid.toString(),
                            child: new Text('${map.time}',
                                style: new TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            selectedRegion = newValue;
                            // print(selectedRegion);
                            slotId = selectedRegion.toString();
                          });
                        },
                      ),
                    ),
                  )),
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
                                flag = true;
                                APIservice apIservice = APIservice();
                                await apIservice.getServiceTime();
                                await apIservice.getEntry();
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

class Region {
  final int slotid;
  final String time;

  Region({this.slotid, this.time});
  factory Region.fromJson(Map<String, dynamic> json) {
    return new Region(slotid: json['slotid'], time: json['time']);
  }
}
