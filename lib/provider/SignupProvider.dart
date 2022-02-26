

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupProvider with ChangeNotifier {

  signUp({required String name,required String phone,required String email,required String password,required String cPassword}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = "https://bestonlineloot.com/api/user/register";


    try {
      final response = await http.post(
      Uri.parse(url),
      body: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "confirm_password": cPassword
      });

      final result = json.decode(response.body);
      print(result);

      if(result['status'] == "success") {
        print("message: ${result['message']}");
        prefs.remove("id");
        prefs.remove("name");
        prefs.remove("phone");
        prefs.remove("email");
        prefs.remove("token");
        return result;
      } else if(result['status'] == "error") {
        print("message: ${result['message']}");
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