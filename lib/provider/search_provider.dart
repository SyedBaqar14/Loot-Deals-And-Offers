import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loot/model/offers_model.dart';

class SearchProvider with ChangeNotifier {
  getSearchResults(
      {required String keyword, required String searchCategory}) async {
    print("keywordTrending: $keyword");

    late String url;
    if (searchCategory == "latestOffers") {
      print("searchCategory == latestOffers");
      url =
          "https://bestonlineloot.com/api/offers/search?keyword=$keyword";
    } else if (searchCategory == "trendingOffers") {
      print("searchCategory == trendingOffers");
      url =
          "https://bestonlineloot.com/api/trending-offers/search?keyword=$keyword";
    } else if (searchCategory == "couponCodes") {
      print("searchCategory == couponCodes");
      url =
          "https://bestonlineloot.com/api/coupon-codes/search?keyword=$keyword";
    }
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Accept': 'application/json',
          'Authorization':
              'Bearer NmtjejlSSXFPOWtMZ2J2VVlBSnF6MFdGUG9OMzQrRVVib2UzaUFwUXQ1UnhKZjRRV3AyTWlaR2VFOEhBY1Freg=='
        },
      );

      var result = json.decode(response.body);

      print(result);

      if (result['status'] == "success") {
        LatestDealsModel searchModel = LatestDealsModel.fromJson(result);
        return searchModel;
      } else if (result['status'] != "success") {
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
