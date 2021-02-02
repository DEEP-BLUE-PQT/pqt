import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/navigation.dart';
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
  int _gendervalue = 1;
  List genders = ['Male', 'Female', 'Others'];

  APIservice apIservice = APIservice();

  getDocList() async {
    await apIservice.getDoctorList();
  }

  getSlotsList() async {
    await apIservice.getSlotsList();
  }

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
  final userAge = new TextEditingController();
  final userGender = new TextEditingController();

  @override
  void initState() {
    getData();
    getDocList();
    getSlotsList();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      userName.text = prefs.getString("userName");
      userContact.text = prefs.getString("userContact");
      userEmail.text = prefs.getString("userEmail");
      userAge.text = prefs.getString("userAge");
      userGender.text = prefs.getString('userGender');
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
                          controller: userAge,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Enter Age",
                              icon: Icon(Icons.add_chart)),
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
                        width: 380,
                        child: TextFormField(
                          controller: userGender,
                          decoration: InputDecoration(
                              hintText:
                                  "Enter M for Male , F for Female , O for Others",
                              icon: Icon(Icons.add)),
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
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (userName.text == '') {
                                _onBasicAlertPressed(
                                    context, 'Please Enter Name');
                              }
                              if (userAge.text == '') {
                                _onBasicAlertPressed(context, 'Please Age');
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
                                prefs.setString("userAge", userAge.text);
                                prefs.setString("userGender",
                                    userGender.text.toLowerCase());

                                userNameText = userName.text;
                                userContactText = userContact.text;
                                userEmailText = userEmail.text;
                                userAgeText = userAge.text;
                                userGenderText = userGender.text;
                                Navigator.pushNamed(context, Bnavigation.route);
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
