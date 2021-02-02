import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String data =
      '[{"ID": 1, "Code": "01", "Description": "REGION I (ILOCOS REGION)", "PSGCCode": "010000000"}, {"ID": 2, "Code": "02", "Description": "REGION II (CAGAYAN VALLEY)", "PSGCCode": "020000000"}]';
  List<Region> _region = [];
  String selectedRegion;

  @override
  Widget build(BuildContext context) {
    final json = JsonDecoder().convert(data);
    _region = (json).map<Region>((item) => Region.fromJson(item)).toList();
    selectedRegion = _region[0].regionDescription;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButtonHideUnderline(
              child: new DropdownButton<String>(
                hint: new Text("Select Region"),
                value: selectedRegion,
                isDense: true,
                onChanged: (String newValue) {
                  setState(() {
                    selectedRegion = newValue;
                  });
                  print(selectedRegion);
                },
                items: _region.map((Region map) {
                  return new DropdownMenuItem<String>(
                    value: map.regionDescription,
                    child: new Text(map.regionDescription,
                        style: new TextStyle(color: Colors.black)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Region {
  final int regionid;
  final String regionDescription;

  Region({this.regionid, this.regionDescription});
  factory Region.fromJson(Map<String, dynamic> json) {
    return new Region(
        regionid: json['ID'], regionDescription: json['Description']);
  }
}
