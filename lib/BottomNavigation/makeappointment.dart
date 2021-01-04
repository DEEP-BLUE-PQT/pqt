import 'package:flutter/material.dart';



class MakeAppointment extends StatefulWidget {
  static String route = 'Makeappointment';
  @override
  _MakeAppointmentState createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  int _value = null;
  int _gendervalue = null;

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
      backgroundColor: Color(0xFF3D00E0),
      body: Column(
        children: [
          Container(
            color: Color(0xFF3D00E0),
            height:135,
            width: 380,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dr. Neela Iyer', style: TextStyle(color: Colors.white, fontSize: 25)),
                    Text('Pediatrician', style: TextStyle(color: Colors.white, fontSize: 15)),
                  ]
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [

                Center(
                    heightFactor: 0.01,
                    child: Container(
                      child: ListTile(
                        dense: true ,
                        leading: Text('DATE', style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
                      ),
                    )
                ),

                Center(

                    child: Container(
                      child: ListTile(
                        dense: true ,
                        leading: Text('TIME',
                            style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
                        trailing: DropdownButton(
                            value: _value,
                            hint: Align(alignment: Alignment.centerRight,
                              child: Text("Select Slot", style: TextStyle(color: Colors.grey),),),
                            items: [
                              DropdownMenuItem(
                                child: Text("First Item"),
                                value: 1,),
                              DropdownMenuItem(
                                child: Text("Second Item"),
                                value: 2,),
                              DropdownMenuItem(
                                  child: Text("Third Item"),
                                  value: 3),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }
                        ),
                      ),
                    )
                ),


                Center(
                  child: Card(
                      shadowColor: Color(0xFF3D00E0),
                      child: Column(
                        children: [
                          ListTile(
                            dense: true ,
                            leading: Text('NAME', style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0)),),
                            trailing: Text('Rohan Gupta',style: TextStyle(fontSize: 15),),
                          ),

                          Divider(color: Color(0xFF3D00E0),),

                          ListTile(
                            dense: true ,
                            leading: Text('AGE',
                                style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
                            trailing: Text('15',style: TextStyle(fontSize: 15),),
                          ),

                          Divider(color: Color(0xFF3D00E0)),

                          ListTile(
                            dense: true ,
                            leading: Text('GENDER',
                                style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
                            trailing: Text('MALE',style: TextStyle(fontSize: 15),),
                          ),

                          Divider(color: Color(0xFF3D00E0)),

                          ListTile(
                            dense: true ,
                            leading: Text('DISABILITY',
                                style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
                            trailing: Text('No',style: TextStyle(fontSize: 15),),
                          ),

                          Divider(color: Color(0xFF3D00E0),),

                          ListTile(
                            dense: true ,
                            leading: Text('PHONE NO.',
                                style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))),
                            trailing: Text('987654321',style: TextStyle(fontSize: 15),),
                          ),

                        ],
                      )
                  ),
                ),



                Center(
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                  color: Color(0xFF3D00E0),
                                  child: Text('EDIT DETAILS', style: TextStyle(color: Colors.white),),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return MyDialog();
                                        });
                                  }//on pressed
                              ),


                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(
                                    color: Color(0xFF3D00E0),
                                    width: 5.0,
                                  )),
                            ),


                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Colors.red,
                                child: Text('BOOK APPOINTMENT', style: TextStyle(color: Colors.white),),
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                      color: Colors.red,
                                      width: 5.0,
                                    )),
                              ),
                            ),
                          ]
                      )
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
            height: MediaQuery.of(context).size.height * 0.8,
          ),

        ],
      ),
    );
  }
}


class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {

  int _gendervalue = null;

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
    return AlertDialog(
        title: Text('DETAILS',
          style: TextStyle(
              fontWeight: FontWeight
                  .w500,
              color: Color(0xFF3D00E0)),
        ),
        content: setupAlertDialoadContainer()

    );
  }

  Widget setupAlertDialoadContainer() {
    return Container(
        height: 300.0, // Change as per your requirement
        width: 300.0, // Change as per your requirement
        child: ListView(
            children: [

              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'NAME',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF3D00E0))
                ),
              ),

              DropdownButton(
                hint: Text('AGE', style: TextStyle(fontWeight: FontWeight.w500,
                    color: Color(0xFF3D00E0))), // Not necessary for Option 1
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

              DropdownButton(
                  value: _gendervalue,
                  hint: Align(alignment: Alignment.centerRight,
                      child: Text(
                        "GENDER", style: TextStyle(fontWeight: FontWeight.w500,
                          color: Color(0xFF3D00E0))
                        ,)
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Text("MALE"), value: 1,),

                    DropdownMenuItem(
                      child: Text("FEMALE"), value: 2,),

                    DropdownMenuItem(
                        child: Text("OTHERS"), value: 3),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _gendervalue = value;
                    });
                    print(_gendervalue);
                  }
              ),


              DropdownButton(
                hint: Text('DISABILITY', style: TextStyle(fontWeight: FontWeight
                    .w500, color: Color(0xFF3D00E0))),
                // Not necessary for Option 1
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

              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'MOBILE NO.',
                    labelStyle: TextStyle(fontWeight: FontWeight.w500,
                        color: Color(0xFF3D00E0))
                ),
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Color(0xFF3D00E0),
                      child: Text(
                        'SAVE', style: TextStyle(color: Colors.white),),
                      onPressed: () {},
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
            ])
    );
  }
}