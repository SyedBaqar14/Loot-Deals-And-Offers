
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loot/model/offers_model.dart';

class CouponCodesProvider with ChangeNotifier {

  getCouponCodes({required int pageNumber}) async {

    final url = "https://bestonlineloot.com/api/coupon-codes?page=$pageNumber&per_page=5";

    try {
      final response = await http.get(Uri.parse(url),
        headers: <String, String> {
          'Accept': 'application/json',
          'Authorization': 'Bearer NmtjejlSSXFPOWtMZ2J2VVlBSnF6MFdGUG9OMzQrRVVib2UzaUFwUXQ1UnhKZjRRV3AyTWlaR2VFOEhBY1Freg=='
        },
      );

      var result = json.decode(response.body);

      if(result['status'] == "success") {
        LatestDealsModel latestDealsModel = LatestDealsModel.fromJson(result);
        return latestDealsModel;
      } else if(result['status'] != "success") {
        return result['message'];
      } else {
        return 'Internal server error';
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}