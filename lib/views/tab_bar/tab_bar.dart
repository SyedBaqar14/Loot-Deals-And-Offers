import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loot/components/side_nav.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:loot/views/coupons/coupons.dart';
import 'package:loot/views/trending_deals/trending_deals.dart';
import 'package:loot/views/latest_deals/latest_deals.dart';

class TabBarLoot extends StatelessWidget {
  const TabBarLoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          elevation: 4,
          child: SideNavigation(),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: appBarBackgroundColor),
          centerTitle: true,
          title: Text(
            'bestonlineloot.com',
            style: TextStyle(color: kTextTitleColor),
          ),
          backgroundColor: appBarBackgroundColor,
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            indicatorColor: kUniversalColor,
            labelColor: kTextTitleColor,
            tabs: [
              Tab(text: "Latest Offers"),
              Tab(text: "Trending Offers"),
              Tab(text: "Coupon Codes"),
            ],
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search, color: Colors.white,),
                onPressed: () {
                  Navigator.pushNamed(context, search);
                }),
          ],
        ),
        body: const TabBarView(
          children: [
            LatestOffers(),
            TrendingOffers(),
            CouponCodes(),
          ],
        ),
      ),
    );
  }
}
