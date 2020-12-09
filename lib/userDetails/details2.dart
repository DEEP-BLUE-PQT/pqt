import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/BottomNavigation/navigation.dart';

class Details2 extends StatefulWidget {
  @override
  _Details2State createState() => _Details2State();
}

class _Details2State extends State<Details2> {
  List<String> _age = [
    '(0-4)',
    '(15-25)',
    '(25 - 40)',
    '(40 - 60)',
    '(5-14)',
    '60+'
  ];
  List<String> _disability = ['No disability', 'disability']; // Option 2
  String _selectedAge;
  String _selectedDisability; // Option 2
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
                      child: DropdownButton(
                        hint: Text('Age'), // Not necessary for Option 1
                        value: _selectedAge,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedAge = newValue;
                          });
                        },
                        items: _age.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                    Center(
                      child: DropdownButton(
                        hint: Text('Disability'), // Not necessary for Option 1
                        value: _selectedDisability,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedDisability = newValue;
                          });
                        },
                        items: _disability.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Color(0xFF3D00E0),
                                child: Text(
                                  'BACK',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
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
                          Container(
                            child: ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Color(0xFF3D00E0),
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Bnavigation()),
                                  );
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
                        ],
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
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
