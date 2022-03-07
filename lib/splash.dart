import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/routes/routes_names.dart';

import 'config/asset_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, tabBar);
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
                  Image.asset(AssetConfig.kLootBag, fit: BoxFit.contain,height: 150, width: 150,),
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
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
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
