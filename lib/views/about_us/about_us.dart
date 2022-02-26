

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loot/components/side_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 50,),
                  child: Text('About us',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),)
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Online Offers & Deals",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                  child: RichText(
                  text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  ),
                  children: <TextSpan>[
                  new TextSpan(text: "Our AI biased algorithm search for the best deals and offers across various sections of the online stores and present them to our shoppers. This helps them to make better shopping decisions and save more using our deals and offers. We at loot continuously focus on best deals available online and provide you the best value for money offers and deals. Also, our USP is ",
                    style:  GoogleFonts.lato(
                      color: Colors.grey.shade700,)),
                  TextSpan(text: "we recommend products and gadgets you don't know about but maybe useful for you. ",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(.65),)),
                    TextSpan(text: "We do not sell any products; we only provide offers and deals of all stores at a single place.",
                        style: GoogleFonts.lato(
                          color: Colors.redAccent,)),
                  ],
                  ),
                  ),
                ),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Coupon Code",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We also provide discount Coupon Code of all type of online stores which is available. ",
                  style:  GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Loot App is Powered by RPM Tech Tips.",
                  style:  GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "RPM Tech Tips is a YouTube Channel which is Focused on Technology. You will get all types of Tech videos which Include –Technology Explained. Tech Reviews. Tips & Tricks. Product Unboxing. Software Tutorials, how to “Fix” Videos, Computer Problems.",
                  style:  GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Contact Us",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
              child: RichText(
                text: new TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at ",
                        style: GoogleFonts.lato(
                          color: Colors.grey.shade700,)),
                    new TextSpan(text: "app@rpmtechtips.com",
                        style: GoogleFonts.lato(
                          color: Colors.blue,)),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  const AboutUs();
}
