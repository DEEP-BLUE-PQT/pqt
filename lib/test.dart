import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      home: MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  State createState() => new _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer _timer1;
  Timer _timer2;
  int _start1 = 10;
  int _start2 = 5;

  void startTimer() {
    if (_timer1 != null) {
      _timer1.cancel();
      _timer1 = null;
    } else {
      _timer1 = new Timer.periodic(
        const Duration(seconds: 3),
        (Timer timer1) => setState(
          () {
            startTimer2();
          },
        ),
      );
    }
  }

  void startTimer2() {
    if (_timer2 != null) {
      _timer2.cancel();
      _timer2 = null;
    } else {
      _timer2 = new Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer2) => setState(
          () {
            if (_start2 < 1) {
              timer2.cancel();
            } else {
              _start2 = _start2 - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer1.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Timer test")),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              startTimer();
            },
            child: Text("start"),
          ),
          Text("$_start2")
        ],
      ),
    );
  }
}
