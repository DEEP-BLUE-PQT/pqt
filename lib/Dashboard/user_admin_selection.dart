import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ButtonTheme(minWidth: 100.0, height: 50.0,
                child: RaisedButton(
                  color: Colors.blue[900],
                  child: Text('USER', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.blue[900], width: 5.0,)),
                ),
              ),
            ),

            SizedBox(width: 25,),

            Container(
              child: ButtonTheme(minWidth: 100.0, height: 50.0,
                child: RaisedButton(
                  color: Colors.blue[900],
                  child: Text('ADMIN', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.blue[900], width: 5.0,)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
