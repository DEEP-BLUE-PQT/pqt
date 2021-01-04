import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/APIs/admin_login_api.dart';
import 'package:flutter_app_pqt_splash/admin_details/admin_details.dart';
import 'package:flutter_app_pqt_splash/userDetails/details.dart';

class AdminSel extends StatefulWidget {
  @override
  _AdminSelState createState() => _AdminSelState();
}

class _AdminSelState extends State<AdminSel> {
  APIservice apIservice = APIservice();
  @override
  void initState() {
    getDocList();
  }

  getDocList() async {
    await apIservice.getDoctorList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Who Are You?",
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      padding: EdgeInsets.all(40.0),
                      color: Color(0xFF3D00E0),
                      child: Text(
                        'USER',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Details.route,
                        );
                      },
                      shape: CircleBorder(
                        side: BorderSide(
                          color: Color(0xFF3D00E0),
                          width: 5.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  child: ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(40.0),
                        color: Color(0xFF3D00E0),
                        child: Text(
                          'ADMIN',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AdminDetails.route,
                          );
                        },
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Color(0xFF3D00E0),
                            width: 5.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
