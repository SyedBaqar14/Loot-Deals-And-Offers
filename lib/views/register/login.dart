import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loot/Heading.dart';
import 'package:loot/components/skip_btn.dart';
import 'package:loot/config/asset_config.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/provider/LoginProvider.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:loot/views/tab_bar/tab_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;
  bool _isloading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late FToast fToast;

  // ProgressDialog pr;
  var appversion;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _checkfieldData();
    // _appversion();
    // pr = new ProgressDialog(context, showLogs: true);
    // pr.style(message: 'Please wait...');
  }

  void _checkfieldData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var emailaddress = prefs.getString('email');
      var ppassword = prefs.getString('password');

      if (emailaddress != null && password != null) {
        setState(() {
          email = TextEditingController(text: emailaddress);
          password = TextEditingController(text: ppassword);
        });
      }
    } catch (e) {
      print(e);
    }
  }

//errors handling if catch error

  void onError(String error) async {
    // Toast.show(error, context,
    //     duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    print(error);
    // pr.hide();
  }

// call from signin button to signin

  _signin() async {
    // pr.show();
    setState(() {
      _isloading = true;
    });
    await Provider.of<LoginProvider>(context, listen: false)
        .getLogin(email: email.text, password: password.text)
        .then((user) {
      print(user);
      setState(() {
        _isloading = false;
      });
      if (user == "success") {
        // pr.hide();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => TabBarLoot()),
                (Route<dynamic> route) => false);
      } else {
        _showToast(message: user);
        // pr.hide();
        // Toast.show(user.toString(), context,
        //     duration:  Toast.LENGTH_LONG, gravity: Toast.CENTER);
      }
    }).catchError((Object error) => onError(error.toString()));

    // pr.hide();
  }

  _showToast({required String message}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.orangeAccent,
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12.0,
          ),
          Text(message, style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color:
              Colors.white),),
        ],
      ),
    );


    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );

    // Custom Toast Position
    // fToast.showToast(
    //     child: toast,
    //     toastDuration: Duration(seconds: 2),
    //     positionedToastBuilder: (context, child) {
    //       return Positioned(
    //         child: child,
    //         top: 16.0,
    //         left: 16.0,
    //       );
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SkipBtn(onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => TabBarLoot()),
                            (Route<dynamic> route) => false);
                  }),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 50, right: 0),
                      child: Image.asset(
                        AssetConfig.kLootLogo,
                        height: 67.95,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 0),
                      child: Text(
                        "Loot",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                            color: kUniversalColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 35),
                  child: Heading(
                    text: "Login",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, size: 20,),
                      labelText: "Email",
                      labelStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color:
                          Colors.grey.withOpacity(1)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 35, right: 35),
                  child: TextFormField(
                    controller: password,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.admin_panel_settings),
                      labelText: "Password",
                      labelStyle: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color:
                          Colors.grey.withOpacity(1)),
                    ).copyWith(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        child: isObsecure
                            ? Icon(Icons.remove_red_eye, size: 20,)
                            : Icon(Icons.remove_red_eye_outlined, size: 20,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                _isloading
                ? Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
                :
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 35, right: 35),
                    child: OutlinedButton(
                      // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), side: ),
                        style: OutlinedButton.styleFrom(fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                            backgroundColor: kUniversalColor,
                            // shape:  RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(18.0),
                            //     side: const BorderSide(width: 2.0, color: Colors.black,)
                            // ),
                            side: const BorderSide(width: 2.0, color: kUniversalColor,
                            )),
                        onPressed: (){
                          _signin();
                        }, child: Text("Login",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    )),
                  ),
                ),
                /*
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed(ForgetPassword.routeName);
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Center(
                        child: Text("Forgot Password?",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),

                 */
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New User? ",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color:
                              Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(register);
                          },
                          child: Text("Register Here",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                                color:
                                Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
