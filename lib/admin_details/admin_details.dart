import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/admin_bottom_navigation/add_doctors.dart';

class AdminDetails extends StatefulWidget {
  static String route = 'AdminDetails';
  @override
  _AdminDetailsState createState() => _AdminDetailsState();
}

class _AdminDetailsState extends State<AdminDetails> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        "Enter Admin Details",
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
                              hintText: "Enter Username",
                              icon: Icon(Icons.accessibility_new_outlined)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 380,
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              icon: Icon(Icons.mobile_screen_share)),
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
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, Addoctors.route);
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
