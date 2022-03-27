
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loot/model/offers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetTokenProvider with ChangeNotifier {

  getToken({required String token}) async {

    final url = "https://bestonlineloot.com/api/device_token?token=$token";

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.get(Uri.parse(url),
        headers: <String, String> {
          'Accept': 'application/json',
          'Authorization': 'Bearer NmtjejlSSXFPOWtMZ2J2VVlBSnF6MFdGUG9OMzQrRVVib2UzaUFwUXQ1UnhKZjRRV3AyTWlaR2VFOEhBY1Freg=='
        },
      );

      var result = json.decode(response.body);

      print("result==================================>");
      print(result);
      print("result<==================================");

      if(result['status']) {
        prefs.setBool("devicetokensaved", true);
        return;
      } else if(result['status'] != "success") {
        return result['message'];
      } else {
        return 'Internal server error';
      }
    } catch (e) {
      // print(e);
    }
    notifyListeners();
  }
}