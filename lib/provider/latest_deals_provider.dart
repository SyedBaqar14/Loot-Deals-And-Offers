
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loot/model/offers_model.dart';

class LatestOffersProvider with ChangeNotifier {

  getLatestDeals({required int pageNumber}) async {

    final url = "https://bestonlineloot.com/api/offers?page=$pageNumber&per_page=10";

    try {
      final response = await http.get(Uri.parse(url),
          headers: <String, String> {
            'Accept': 'application/json',
            'Authorization': 'Bearer xxx'
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
