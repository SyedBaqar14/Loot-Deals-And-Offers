import 'package:flutter/material.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, tabBar);
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     colorFilter: ColorFilter.mode(
        //         Colors.black.withOpacity(0.2), BlendMode.dstATop),
        //     fit: BoxFit.fill,
        //     image: const AssetImage(AssetConfig.kSplashBgImage),
        //   ),
        // ),
        child: Center(
          child: Image.asset(AssetConfig.kSplashBgImage, fit: BoxFit.fill,height: double.infinity, width: double.infinity,),
        ),
      ),
    );
  }
}
