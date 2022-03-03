import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loot/config/asset_config.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/provider/SignupProvider.dart';
import 'package:loot/provider/email_verification_provider.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:provider/provider.dart';

import '../../Heading.dart';

class Register extends StatefulWidget {
  static const routeName = "register";

  const Register() : super();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool isObsecure = true;
  late FToast fToast;

  bool subscribe = false;

  void _onSubscribeChanged(bool? newValue) => setState(() {
    subscribe = newValue!;

    // if (subscribe) {
    //   // TODO: Here goes your functionality that remembers the user.
    // } else {
    //   // TODO: Forget the user
    // }
  });

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _controllerName = new TextEditingController();
    _controllerPhone = new TextEditingController();
    _controllerEmailAddress = new TextEditingController();
    _controllerPassword = new TextEditingController();
    _controllerCity = new TextEditingController();
  }

  _showToast({required String message}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.orangeAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
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

  signUpRequest({name, phone, email, password, city, isSubscribe}) async {
    // pr.show();
    if (isSubscribe)  {
      await Provider.of<EmailVerificationProvider>(context, listen: false)
          .verifyEmail(
          email: email,)
          .then((result) async {
          if((result['deliverability']) == "UNDELIVERABLE") {
            subscribe = false;
          } else {
            subscribe = true;
          }
          Future.delayed(Duration(milliseconds: 300));
          await Provider.of<SignupProvider>(context, listen: false)
              .signUp(
              name: name,
              phone: phone,
              email: email,
              password: password,
              city: city,
          subscribe: subscribe)
              .then((result) {
            if (result['status'] == "success") {
              print("subscribe: $subscribe");
              _showToast(message: result['message']);
              Navigator.pushNamed(context, login);
              // pr.hide();
              // print(result['data']['message']);
              // makeToast(mesage: result['data']['message'], context: context);
              // Navigator.of(context).pushNamed(LoginScreen.routeName);
            }
            else if (result['status'] == "error") {
              _showToast(message: result['message']);
              // pr.hide();
              print("${result['message']}");
            }
            else {
              print("${result}");
            }
          });

          // pr.hide();
          // print(result['data']['message']);
          // makeToast(mesage: result['data']['message'], context: context);
          // Navigator.of(context).pushNamed(LoginScreen.routeName);
      });
    } else {
      await Provider.of<SignupProvider>(context, listen: false)
          .signUp(
              name: name,
              phone: phone,
              email: email,
              password: password,
              city: city,
              subscribe: isSubscribe)
          .then((result) {
        if (result['status'] == "success") {
          _showToast(message: result['message']);
          Navigator.of(context).pop;
          // pr.hide();
          // print(result['data']['message']);
          // makeToast(mesage: result['data']['message'], context: context);
          // Navigator.of(context).pushNamed(LoginScreen.routeName);
        } else if (result['status'] == "error") {
          _showToast(message: result['message']);
          // pr.hide();
          print("${result['message']}");
        } else {
          print("${result}");
        }
      });
    }
  }

  late TextEditingController _controllerName;
  late TextEditingController _controllerPhone;
  late TextEditingController _controllerEmailAddress;
  late TextEditingController _controllerPassword;
  late TextEditingController _controllerCity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 25),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: 30,
                      color: kUniversalColor,
                    ),
                  ),
                ),
                /*
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 20, right: 0),
                  child: Image.asset(AssetConfig.kLootBag, height: 67.95,
                    width: 120,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 2, right: 0),
                  child: Text("Bestonlineloot.com",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color:
                        Colors.black),),
                ),

                 */
                /*
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0, top: 20, right: 0),
                      child: Image.asset(
                        AssetConfig.kLootLogo,
                        height: 67.95,
                        width: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 0),
                      child: Text(
                        "Loot",
                        style: TextStyle(
                            color: kUniversalColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 32),
                      ),
                    ),
                  ],
                ),

                 */
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 35),
                  child: Heading(
                    text: "Register",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: TextFormField(
                    controller: _controllerName,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name is required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: TextFormField(
                    controller: _controllerEmailAddress,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(
                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                          .hasMatch(val)) {
                        return 'Please enter a valid email Address';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: TextFormField(
                    controller: _controllerPhone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Phone Number is required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle:
                      TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: TextFormField(
                    controller: _controllerPassword,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                    ).copyWith(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObsecure = !isObsecure;
                          });
                        },
                        child: isObsecure
                            ? Icon(
                                Icons.remove_red_eye,
                                size: 20,
                              )
                            : Icon(
                                Icons.remove_red_eye_outlined,
                                size: 20,
                              ),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Password is required";
                      } else if (val.length < 8) {
                        return "Password must be 8 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: TextFormField(
                    controller: _controllerCity,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "City is required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "City",
                      labelStyle:
                      TextStyle(fontFamily: 'Poppins', color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 25, right: 35),
                  child: Row(
                    children: [
                      Checkbox(
                          value: subscribe,
                          onChanged: _onSubscribeChanged
                      ),
                      const Text("Subscribe for product updates.")
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 35, right: 35),
                    child: OutlinedButton(
                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), side: ),
                        style: OutlinedButton.styleFrom(
                            fixedSize: Size.fromWidth(
                                MediaQuery.of(context).size.width),
                            backgroundColor: kUniversalColor,
                            // shape:  RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(18.0),
                            //     side: const BorderSide(width: 2.0, color: Colors.black,)
                            // ),
                            side: const BorderSide(
                              width: 2.0,
                              color: kUniversalColor,
                            )),
                        onPressed: () {
                          signUpRequest(
                              name: _controllerName.text,
                              phone: _controllerPhone.text,
                              email: _controllerEmailAddress.text,
                              password: _controllerPassword.text,
                              city: _controllerCity.text,
                          isSubscribe: subscribe);
                        },
                        child: Text(
                          "Register",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
                  child: RichText(
                    text: new TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "By clicking sign up you agree to our ",
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                            fontWeight: FontWeight.bold)),
                        new TextSpan(text: "Privacy Policy ",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: kUniversalColor,)),
                        TextSpan(text: "& ",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        new TextSpan(text: "Terms & Conditions. ",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: kUniversalColor,)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
