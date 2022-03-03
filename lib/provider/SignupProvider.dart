

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupProvider with ChangeNotifier {

  signUp({required String name,required String phone,required String email,required String password,required String city, required bool subscribe}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    const url = "https://bestonlineloot.com/api/user/register";

    try {
      final response = await http.post(
      Uri.parse(url),
      body: <String, dynamic>{
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "city": city,
        "subscribe": subscribe.toString()
      });

      final result = json.decode(response.body);
      print(result);

      if(result['status'] == "success") {
        print("message: ${result['message']}");
        prefs.remove("id");
        prefs.remove("name");
        prefs.remove("phone");
        prefs.remove("email");
        prefs.remove("city");
        prefs.remove("token");
        return result;
      } else if(result['status'] == "error") {
        if (kDebugMode) {
          print("message: ${result['message']}");
        }
        return result;
      } else {
        return 'Internal server error';
      }
    } on SocketException {
      // throw VerificationException("No internet connection");
    } on HttpException {
      // throw VerificationException('No service');
    } on Exception catch (e) {
      print(e);
    }

    notifyListeners();
  }
}