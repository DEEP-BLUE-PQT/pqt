import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static DateTime now = new DateTime.now();
  static String wait = '00:15:00';
  static var listWait = wait.split(':');
  DateTime date = new DateTime(now.year, now.month, now.day,
      int.parse(listWait[0]), int.parse(listWait[1]), int.parse(listWait[2]));

  // int _counter = 10; //'14:04:56'
  Timer _timer;

  void _startTimer() {
    // _counter = 10;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        Duration difference = date.difference(DateTime.now());
        if (difference.inSeconds > 0) {
          print(difference.inSeconds);
          // _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            RaisedButton(
              onPressed: () => _startTimer(),
              child: Text("Start 10 second count down"),
            ),
          ],
        ),
      ),
    );
  }
}
