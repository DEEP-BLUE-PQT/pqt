import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/splashScreen/splash.dart';

import 'details2.dart';

class Details extends StatefulWidget {
  static String route = 'details';
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                          validator: (value) => EmailValidator.validate(value)
                              ? null
                              : "Please enter a valid email",
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
                            onPressed: () {
                              Navigator.pushNamed(context, Details2.route);
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
