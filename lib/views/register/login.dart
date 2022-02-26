import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loot/config/asset_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/routes/routes_names.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();

  const Login();
}

class _LoginState extends State<Login> {

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarColor: appBarBackgroundColor),
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(color: kTextTitleColor),
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: appBarBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 100,),
                Center(
                  child: Image.asset(AssetConfig.kSplashBgImage,
                    width: 50,
                    height: 50,
                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon:  Icon(Icons.email_outlined, color: Colors.orange,),
                      labelText: "Enter email",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.black
                              : Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.black, width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon:  Icon(Icons.security_rounded, color: Colors.orange),
                      labelText: "Enter password",
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.black
                              : Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Forgot password?",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: OutlinedButton(
                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), side: ),
                        style: OutlinedButton.styleFrom(fixedSize: Size.fromWidth(150),
                            backgroundColor: Colors.white,
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(width: 2.0, color: Colors.black,)
                            ),
                            side: const BorderSide(width: 2.0, color: Colors.black,
                            )),
                          onPressed: (){}, child: Text("Register",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    )),
                  ),
                ),
                const SizedBox(height: 15,),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, register),
                      child: Text("I don't have an account",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
