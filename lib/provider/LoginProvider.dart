import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  getLogin({email, password}) async {
    // print(email);
    // print(password);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    const url = 'https://bestonlineloot.com/api/user/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{'Accept': 'application/json'},
        body: ({
          "email": email,
          "password": password,
        }),
      );

      // print(response.statusCode);
      // print(response.body);
      // print(json.decode(response.body));

      var result = json.decode(response.body);

      if (kDebugMode) {
        print(result);
      }
      if (result['status'] == "success") {
        prefs.setString("id", result['data']['id']);
        prefs.setString("name", result['data']['name']);
        prefs.setString("email", result['data']['email']);
        prefs.setString("phone", result['data']['phone']);
        prefs.setString("city", result['data']['city']);
        prefs.setString("token", result['token']);
        // print(result['data']['name']);
        // print("city: ${result['data']['city']}");
        // prefs.setBool("isLoggedIn", true);
        return 'success';
      } else if (result['status'] == "error") {
        return result['message'];
      } else {
        return 'Internal server error xyz';
      }
    } on SocketException {
      // throw Verifica('No Internet connection');
    } on HttpException {
      // throw VerificationException('No service');
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
