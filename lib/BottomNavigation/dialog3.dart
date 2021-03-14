import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/myappointment.dart';
import 'package:flutter_app_pqt_splash/sqlite/sqllite2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'makeappointment.dart';

class MyDialog3 extends StatefulWidget {
  @override
  _MyDialog3State createState() => new _MyDialog3State();
}

class _MyDialog3State extends State<MyDialog3> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 75.0,
        width: 75.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                      Navigator.pushReplacementNamed(
                          context, Myappointment.route);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(
                          color: Color(0xFF3D00E0),
                          width: 5.0,
                        )),
                  ),
                ),
                ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  child: RaisedButton(
                    color: Color(0xFF3D00E0),
                    child: Text(
                      'Feeback',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await _launchInBrowser(
                          'https://forms.gle/EomvUMkbQQChgy34A');
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
          ],
        ),
      ),
      title: Center(
        child: Text(
          'Hope you had a convenient experience',
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0)),
        ),
      ),
    );
  }
}
