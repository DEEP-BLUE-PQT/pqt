import 'dart:convert';
import 'package:flutter_app_pqt_splash/secure_storage/storage.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class APIservice {
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
}
