

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EmailVerificationProvider with ChangeNotifier {

  verifyEmail({required String email}) async {

    final url = "https://emailvalidation.abstractapi.com/v1/?api_key=585c0615f58049638f417f4766bc494f&email=$email";

    try {
      final response = await http.get(
          Uri.parse(url),
          );

      final result = json.decode(response.body);
      if (kDebugMode) {
        print(result);
      }

      return result;
    } on SocketException {
      // throw VerificationException("No internet connection");
    } on HttpException {
      // throw VerificationException('No service');
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    notifyListeners();
  }
}