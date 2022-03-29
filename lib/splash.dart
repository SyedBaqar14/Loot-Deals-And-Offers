import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/provider/get_token_provider.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/asset_config.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool showText = false;

  saveToken() async {
    await Provider.of<GetTokenProvider>(context, listen: false)
        .getToken(token: TemClass.token);
  }

  bool? appLaunchedFirstTime;
  initializeSharedPrefrences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appLaunchedFirstTime = await prefs.getBool("devicetokensaved");
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPrefrences();
    Future.delayed(const Duration(seconds: 2), () {
      if(appLaunchedFirstTime == null) {
        print("appLaunchedFirstTime is null");
        saveToken();
      } else {
        print("appLaunchedFirstTime is not null: $appLaunchedFirstTime");
      }
      setState(() {
        showText = true;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(tabBar, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kUniversalColor,
      body: Container(
        // height: size.height,
        // width: size.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     colorFilter: ColorFilter.mode(
        //         Colors.black.withOpacity(0.2), BlendMode.dstATop),
        //     fit: BoxFit.fill,
        //     image: const AssetImage(AssetConfig.kSplashBgImage),
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(AssetConfig.kLootBag)
                      )
                    ),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: AnimatedOpacity(
                          // If the widget is visible, animate to 0.0 (invisible).
                          // If the widget is hidden, animate to 1.0 (fully visible).
                          opacity: showText ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          // The green box must be a child of the AnimatedOpacity widget.
                          child: Text("\n₹", style: TextStyle(color: Colors.white, fontSize: 60),)
                        ))
                  ),
                ],
              ),
              Text("Bestonlineloot.com",
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RichText(
        text: TextSpan(
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: [
            WidgetSpan(child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Made with",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),),
                    Image.asset(AssetConfig.kLootHeart, width: 20, height: 20,),
                    Text(" in India",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),),
                  ],
                ),
              ),
            )),
          ]
      ))
    );
  }
}
