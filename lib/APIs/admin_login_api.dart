import 'dart:convert';
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
      doctorList = mapResponse["data"];
    }
  }

  Future<String> getSlotsList() async {
    var response = await http.get(
      ngrok + 'api/doctor/slots',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      newSlotMap = mapResponse["data"];
    }
  }

  Future<String> getServiceTime() async {
    await getData();

    Map jsonMap = {
      "age": int.parse(age),
      "doctor": depName,
      "disability": "No disability",
      "gender": gender
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
      serviceMlTime = mapResponse['prediction'];
    }
  }

  // Future<String> test() async {
  //   var response = await http.get(ngrok3);
  //   if (response.statusCode == 200) {
  //     var mapResponse = json.decode(response.body);
  //     newWaitingTime = mapResponse["wt1"];
  //   }
  // }
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
      newWaitingTime = mapResponse["wt1"];
      successcons = mapResponse["success"];
    }
  }

  Future<String> getEntry() async {
    for (var i = 0; i < slots.length; i++) {
      if (slots[i]["slotid"] == int.parse(slotId)) {
        timee = slots[i]["time"];
      }
    }
    print("===========================");
    print(patientId + nameOfPatient);
    Map jsonMap = {
      "patientid": patientId,
      "slotid": slotId,
      "doctorid": docId,
      "st1": serviceMlTime,
      "pcit": timee.split('-')[0],
      "slotend": timee.split('-')[1]
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
      }
    }
  }

  Future<String> readBM() async {
    Map jsonMap = {
      "patientid": patientId,
    };
    var response = await http.post(
      ngrok1 + 'readbm',
      body: json.encode(jsonMap),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      //
      var mapResponse = json.decode(response.body);
      success = mapResponse['success'];
      if (success == 1) {
        pcit2 = mapResponse["pcit2"];
        pcit3 = mapResponse["pcit3"];
        wt2 = mapResponse["wt2"];
        wt3 = mapResponse["wt3"];
        print(mapResponse);
      }
    }
  }
}
