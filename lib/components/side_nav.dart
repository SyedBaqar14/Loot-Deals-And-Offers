import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loot/config/asset_config.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:loot/views/about_us/about_us.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
            color: kUniversalColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        AssetConfig.kLootBag,
                        height: 70.0,
                        width: 70.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        name != null
                            ? Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 8),
                          child: Text(
                            name ?? "name",
                            style: TextStyle(
                              color: kSideNaveHeaderTitleColor,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 30.0),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, login),
                            child: Container(
                                width: 150,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.orange),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child:
                                              Icon(Icons.lock_open, size: 14),
                                        ),
                                        TextSpan(
                                          text: "   Login",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white.withOpacity(.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        email != null
                        ? Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 8),
                          child: Text(
                            email ?? "email",
                            style: TextStyle(
                              color: kSideNaveHeaderTitleColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 30.0),
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(context, register),
                            child: Container(
                                width: 150,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.orange),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child:
                                          Icon(Icons.login_outlined, size: 14),
                                        ),
                                        TextSpan(
                                          text: "   Signup",
                                          style: GoogleFonts.roboto(
                                            color: Colors.white.withOpacity(.8),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
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
              Icons.info,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () async {
              Navigator.of(context).pop();

              String url = "https://bestonlineloot.com/policy-policy";
              if (await canLaunch(url))
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
              // ),
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
            onTap: () async {
              Navigator.of(context).pop();

              String url = "https://bestonlineloot.com/terms-and-conditions";
              if (await canLaunch(url))
                await launch(url);
              else
                // can't launch url, there is some error
                throw "Could not launch $url";
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
              // ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_page_outlined,
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
          name != null
          ? ListTile(
            leading: Icon(
              Icons.logout,
              color: kSideNaveIconColor,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: kSideNaveTextColor, fontSize: 14),
            ),
            onTap: () => {
              Navigator.of(context).pop(),
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const AboutUs()),
              // ),
            },
          )
          : Container()
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
