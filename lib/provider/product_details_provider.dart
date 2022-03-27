
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loot/model/offers_model.dart';
import 'package:loot/model/product_details_model.dart';
import 'package:loot/model/product_details_trending_model.dart';

class DetailsPageProvider with ChangeNotifier {

  getDetailsPage({required String productID, required bool isLatestDeals}) async {

    late final url;
    print("productID: $productID");
    if (isLatestDeals) {
      url = "https://bestonlineloot.com/api/offers/$productID";
    } else {
      url = "https://bestonlineloot.com/api/trending-offers/$productID";
    }

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

      if(result['status'] == "success") {
        if(isLatestDeals) {
          ProductDetailsModel productDetailsModel = ProductDetailsModel
              .fromJson(result);
          print("description: ${productDetailsModel.data!.description}");
          return productDetailsModel;
        } else {
          TrendingDetailsModel trendingDetailsModel = TrendingDetailsModel
              .fromJson(result);
          print("description: ${trendingDetailsModel.data!.dscp}");
          return trendingDetailsModel;
        }
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