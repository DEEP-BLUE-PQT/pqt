import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_pqt_splash/secure_storage/storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class APIservice {
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    age = prefs.getString("userAge");
    gender = prefs.getString('userGender').toUpperCase();
    patientId = prefs.getString('userContact');
    nameOfPatient = prefs.getString('userName');
  }

  SecureStorage secureStorage = SecureStorage();

  Future<String> login(String username, String password) async {
    Map jsonMap = {"username": username, "password": password};

    final String apiUrl = ngrok + "api/admin/login";
    final response = await http.post(
      apiUrl,
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      Map mapResponse = json.decode(response.body);
      secureStorage.writeSecureData('token', mapResponse['token']);
      return mapResponse['success'].toString();
    } else {
      return null;
    }
  }

  Future<String> getDoctorList() async {
    var response = await http.get(
      ngrok + 'api/doctor/',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      doctorList = mapResponse["data"];
    }
  }

  // Future<String> getSlotsList() async {
  //   var response = await http.get(
  //     ngrok + 'api/doctor/slots',
  //     headers: {
  //       'Content-type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var mapResponse = json.decode(response.body);
  //     newSlotMap = mapResponse["data"];
  //   }
  // }

  Future<String> getServiceTime() async {
    await getData();
    Map jsonMap = {
      "age": int.parse(age),
      "doctor": depName.toLowerCase(),
      "gender": gender.toLowerCase()
    };

    var response = await http.post(
      ml,
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      // newSlotMap = mapResponse["data"];
      print("*********************************");
      print(mapResponse);
      serviceMlTime = mapResponse['prediction'].toString();
    }
  }

  Future<String> getPosts() async {
    var response = await http.get(ngrok + 'api/posts/');
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      flag1 = true;
      data_post = mapResponse['data'];
      for (var i in data_post) {
        PostData.add(i['post']);
      }
    }
  }

  Future<String> getHistory() async {
    Map jsonMap = {
      "pname": nameOfPatient,
      "pcontact": patientId,
    };
    print("=========================");
    print(userNameText);
    print(userContactText);
    var response = await http.post(
      ngrok1 + 'phistory',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      if (mapResponse['success'] == 1) {
        dataHistory = mapResponse['data'];
      }
    }
  }
  //
  // Future<String> test2() async {
  //   var response = await http.get(ngrok4);
  //   if (response.statusCode == 200) {
  //     var mapResponse = json.decode(response.body);
  //     wt2 = mapResponse["wt2"];
  //   }
  // }

  Future<String> read() async {
    Map jsonMap = {
      "patientid": patientId,
      "doctorid": docId,
      "slotid": slotId,
      "date": dateChoosen
    };
    var response = await http.post(
      ngrok1 + 'readcons',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print("READCONS");
      print(mapResponse);
      newWaitingTime = mapResponse["wt1"];
      successcons = mapResponse["success"];
      pcotDisplay = mapResponse['pcot'];
      pcit2 = mapResponse['pcit2'];
      pcit3 = mapResponse['pcit3'];
    }
  }

  Future<String> getSlots() async {
    Map jsonMap = {
      "doctorid": docId,
      "date": dateChoosen,
    };
    var response = await http.post(
      ngrok1 + 'slots',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      slot = mapResponse;
      slotnew = [];
      slotChoosen = null;
      print(slotnew);
      for (var i in slot.entries) {
        slotnew.add(i.key);
      }
      print(slotnew);
    }
  }

  Future<String> getDates() async {
    Map jsonMap = {
      "doctorid": docId,
    };
    var response = await http.post(
      ngrok1 + 'dates',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      datesList = mapResponse["success"];
    }
  }

  Future<String> getEntry() async {
    print("==========");
    print(serviceMlTime);
    Map jsonMap = {
      "patientid": patientId + '_' + nameOfPatient,
      "slotid": slotId,
      "doctorid": docId,
      "st1": serviceMlTime,
      "pcit": slotChoosen.split('-')[0],
      "slotend": slotChoosen.split('-')[1],
      "date": dateChoosen,
      "age": age,
      "gender": gender,
      "depname": depName
    };
    var response = await http.post(
      ngrok1 + 'consultation',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      //
      var mapResponse = json.decode(response.body);
      if (mapResponse['code'] == -1) {
        fail = true;
      }
      print("I am from consul");
      print(mapResponse);
      trueorfalse = mapResponse["success"];
      message = mapResponse["message"];
      if (trueorfalse == 'True') {
        pcit1 = mapResponse["pcit1"];
        print(pcit1);
        pcit2 = mapResponse["pcit2"];
        pcit3 = mapResponse["pcit3"];
        oldWaitingTime = mapResponse["wt1"];
        displayTime = oldWaitingTime;
        wt2 = mapResponse["wt2"];
        wt3 = mapResponse["wt3"];
        scheduler = mapResponse["scheduler"];
        error = mapResponse["error"];
        pcotDisplay = mapResponse['pcot'];
      }
    }
  }

  Future<String> readBM() async {
    Map jsonMap = {
      "patientid": patientId + '_' + nameOfPatient,
    };
    var response = await http.post(
      ngrok1 + 'readbm',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    print("#####################################################");

    print(response.statusCode);

    if (response.statusCode == 200) {
      //
      var mapResponse = json.decode(response.body);
      print("READBM");
      print(mapResponse);
      success = mapResponse['success'];
      if (success == 1) {
        pcit2 = mapResponse["pcit2"];
        pcit3 = mapResponse["pcit3"];
        wt2 = mapResponse["wt2"];
        wt3 = mapResponse["wt3"];
      }
    }
  }
}
