import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loot/admob_helper.dart';
import 'package:loot/provider/LoginProvider.dart';
import 'package:loot/provider/SignupProvider.dart';
import 'package:loot/provider/coupon_codes_provider.dart';
import 'package:loot/provider/latest_deals_provider.dart';
import 'package:loot/provider/product_details_provider.dart';
import 'package:loot/provider/search_provider.dart';
import 'package:loot/provider/trending_offers_provider.dart';
import 'package:loot/provider/updated_offers_provider.dart';
import 'package:loot/routes/custom_routes.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialization();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: LatestOffersProvider()),
      ChangeNotifierProvider.value(value: DetailsPageProvider()),
      ChangeNotifierProvider.value(value: TrendingOffersProvider()),
      ChangeNotifierProvider.value(value: CouponCodesProvider()),
      ChangeNotifierProvider.value(value: SearchProvider()),
      ChangeNotifierProvider.value(value: UpdatedOffersProvider()),
      ChangeNotifierProvider.value(value: LoginProvider()),
      ChangeNotifierProvider.value(value: SignupProvider())
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Pickker',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange,
      ),
      onGenerateRoute: CustomRoutes.allRoutes,
      initialRoute: splash,
      // home: LatestDeals(),
    );
  }
}
