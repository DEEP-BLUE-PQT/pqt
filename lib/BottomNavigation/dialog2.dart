import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import 'makeappointment.dart';

class MyDialog2 extends StatefulWidget {
  @override
  _MyDialog2State createState() => new _MyDialog2State();
}

class _MyDialog2State extends State<MyDialog2> {
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 100.0,
        width: 75.0,
        child: Column(
          children: [
            Text(message),
            ButtonTheme(
              minWidth: 100.0,
              height: 50.0,
              child: RaisedButton(
                color: Color(0xFF3D00E0),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.pushNamed(context, Myappointment.route);
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
      ),
      title: Center(
        child: Text(
          'Confirmation',
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0)),
        ),
      ),
    );
  }
}
