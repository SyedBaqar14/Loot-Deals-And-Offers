import 'package:flutter/material.dart';
import 'package:loot/views/coupons/coupons.dart';
import 'package:loot/views/register/login.dart';
import 'package:loot/views/register/register.dart';
import 'package:loot/views/search.dart';
import 'package:loot/views/tab_bar/tab_bar.dart';
import 'package:loot/views/trending_deals/trending_deals.dart';
import '../views/latest_deals/latest_deals.dart';
import 'package:loot/routes/routes_names.dart';
import '../not_found.dart';
import '../splash.dart';

class CustomRoutes {
  static Route<dynamic> allRoutes(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case tabBar:
        return MaterialPageRoute(builder: (_) => const TabBarLoot());
      case latestDeals:
        return MaterialPageRoute(builder: (_) => const LatestOffers());
      case trendingDeals:
        return MaterialPageRoute(builder: (_) => const TrendingOffers());
      case coupon:
        return MaterialPageRoute(builder: (_) => const CouponCodes());
      case login:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) =>  const Register());
      case search:
        return MaterialPageRoute(builder: (_) =>  const Search());
    }
    return MaterialPageRoute(builder: (_) => const NotFoundPage());
  }
}
