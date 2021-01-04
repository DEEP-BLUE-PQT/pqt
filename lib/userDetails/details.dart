import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'details2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatefulWidget {
  static String route = 'details';
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  _onBasicAlertPressed(context, String title) {
    Alert(
      style: AlertStyle(
        isButtonVisible: false,
        isCloseButton: true,
        backgroundColor: Colors.white,
      ),
      context: context,
      title: title,
      desc: "Try Again",
    ).show();
  }

  bool validateMobile(String value) {
    // Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return false;
    else
      return true;
  }

  final userName = new TextEditingController();
  final userContact = new TextEditingController();
  final userEmail = new TextEditingController();

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName.text = prefs.getString("userName");
      userContact.text = prefs.getString("userContact");
      userEmail.text = prefs.getString("userEmail");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.indigo,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "Enter User Details",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        child: TextFormField(
                          controller: userName,
                          decoration: InputDecoration(
                              hintText: "Enter Name",
                              icon: Icon(Icons.accessibility_new_outlined)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        child: TextFormField(
                          controller: userContact,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter Mobile Number",
                              icon: Icon(Icons.mobile_screen_share)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        child: TextFormField(
                          controller: userEmail,
                          decoration: InputDecoration(
                              hintText: "Enter Email Address",
                              icon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Color(0xFF3D00E0),
                            child: Text(
                              'NEXT',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (userName.text == '') {
                                _onBasicAlertPressed(
                                    context, 'Please Enter Name');
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(userEmail.text);
                              if (emailValid == false) {
                                _onBasicAlertPressed(
                                    context, 'Please Enter a valid Email');
                              }
                              bool mobileValid =
                                  validateMobile(userContact.text);
                              if (mobileValid == false) {
                                print(mobileValid);
                                _onBasicAlertPressed(context,
                                    'Please Enter a valid Mobile Number');
                              } else {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString("userName", userName.text);
                                prefs.setString(
                                    "userContact", userContact.text);
                                prefs.setString("userEmail", userEmail.text);
                                userNameText = userName.text;
                                userContactText = userContact.text;
                                userEmailText = userEmail.text;
                                Navigator.pushNamed(context, Details2.route);
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  color: Color(0xFF3D00E0),
                                  width: 5.0,
                                )),
                          ),
                        ),
                      ),
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
                height: MediaQuery.of(context).size.height * 0.68,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
