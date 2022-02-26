import 'package:flutter/material.dart';
import 'package:loot/config/asset_config.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:loot/views/about_us/about_us.dart';
import 'package:loot/views/about_us/privacy_policy.dart';
import 'package:loot/views/about_us/terms_and_conditions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/latest_deals/latest_deals.dart';

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {

  late SharedPreferences prefs;
  String? name;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 35),
            color: kUniversalColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, login),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          AssetConfig.kLootLogo,
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 8),
                          child: Text(
                            name ?? "name",
                            style: TextStyle(
                              color: kSideNaveHeaderTitleColor,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 8),
                          child: Text(
                            email ?? "email",
                            style: TextStyle(
                              color: kSideNaveHeaderTitleColor,
                              fontSize: 18,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              AssetConfig.kLatestDeals,
              width: 22,
              height: 22,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Latest Offers',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              DefaultTabController.of(context)!.animateTo(0)
            },
          ),
          ListTile(
            leading: Image.asset(
              AssetConfig.kTrending,
              width: 22,
              height: 22,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Trending Offers',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              DefaultTabController.of(context)!.animateTo(1)
            },
          ),
          ListTile(
            leading: Image.asset(
              AssetConfig.kCoupon,
              width: 22,
              height: 22,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Coupon Codes',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              DefaultTabController.of(context)!.animateTo(2)
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Notification',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const LatestOffers()),
              // ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'About Us',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.playlist_add_check_sharp,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Terms & Conditions',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsAndConditions()),
              ),
            },
          ),
        ],
      ),
    );
  }

  initializeShared() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
    });
  }
  @override
  void initState() {
    initializeShared();
  }
}
