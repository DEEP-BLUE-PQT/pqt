import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'makeappointment.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  void initState() {
    getData();
  }

  List genders = ['Male', 'Female', 'Others'];
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

  int _gendervalue = null;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Center(
          child: Text(
            'DETAILS',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Color(0xFF3D00E0)),
          ),
        ),
        content: setupAlertDialoadContainer());
  }

  Widget setupAlertDialoadContainer() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(children: [
          TextFormField(
            controller: userName,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: 'NAME',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
          ),
          TextFormField(
            controller: userAge,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: "AGE",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
          ),
          TextFormField(
            controller: userGender,
            decoration: InputDecoration(
                labelText: 'Enter M for Male , F for Female , O for Others',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  color: Color(0xFF3D00E0),
                  child: Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("userName", userName.text);
                    prefs.setString("userContact", userContact.text);
                    prefs.setString("userEmail", userEmail.text);
                    prefs.setString("userAge", userAge.text);
                    prefs.setString("userGender", userGender.text);
                    userNameText = userName.text;
                    userContactText = userContact.text;
                    userEmailText = userEmail.text;
                    userAgeText = userAge.text;
                    userGenderText = userGender.text;

                    Navigator.pushNamed(context, MakeAppointment.route);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        color: Color(0xFF3D00E0),
                        width: 5.0,
                      )),
                ),
              ),
            ],
          ),
        ]));
  }
}
