import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminSel extends StatefulWidget {
  @override
  _AdminSelState createState() => _AdminSelState();
}

class _AdminSelState extends State<AdminSel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        // title: Text("widget.title"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(40.0),
                  color: Colors.purple[900],
                  child: Text(
                    'USER',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {},
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.purple[900],
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
                    color: Colors.purple[900],
                    child: Text(
                      'ADMIN',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    onPressed: () {},
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Colors.purple[900],
                        width: 5.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
