
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loot/model/offers_model.dart';

class UpdatedOffersProvider with ChangeNotifier {

  getUpdatedDeals() async {

    final url = "https://bestonlineloot.com/api/latest-offers";

    try {
      final response = await http.get(Uri.parse(url),
          headers: <String, String> {
            'Accept': 'application/json',
            'Authorization': 'Bearer NmtjejlSSXFPOWtMZ2J2VVlBSnF6MFdGUG9OMzQrRVVib2UzaUFwUXQ1UnhKZjRRV3AyTWlaR2VFOEhBY1Freg=='
          },
      );

      var result = json.decode(response.body);

      print(result);

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