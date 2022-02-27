

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loot/components/side_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Terms and Conditions",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 50, right: 40, left: 20,),
                child: Text('Terms & Conditions',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),)
            ),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Last updated: January 25, 2022",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Please read these Terms & Conditions (""Terms"", ""Terms of Service"") carefully before using our site and app (the ""Service"") operated by RPM Tech Tips (us, we, or our).",
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade700,
                      fontSize: 16),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.",
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade700,
                      fontSize: 16),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "By accessing or using the Service you agree to be bound by these Terms & Conditions. If you disagree with any part of the terms then you may not access the Service.",
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade700,
                      fontSize: 16),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Offer Listings",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• Loot site or app doesn't offer any guarantee that you will get products or discounted products or Recharges.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• Loot site or app doesn't guarantee the authenticity or originality of products ordered or purchased from our mentioned product listings and offers.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• Loot site or app doesn't sell any Products as of now. Loot only provides offers and discounts of different e-commerce sites at single place.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• All content, trademarks and logos are copyright of their respective owners.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• You agree that Loot site or app shall not be responsible or liable for any loss or damage of any sort incurred as result of any such dealings. If there is a dispute between participants on this site, or between users and any third party.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• You must be at least 18 year of age to use our services.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "THIRD-PARTY LINKS",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Certain content, products and services available via our Service may include materials from third-parties.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Third-party links on this site may direct you to third-party websites that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or services of third-parties.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We are not liable for any harm or damages related to the purchase or use of goods, services, resources, content, or any other transactions made in connection with any third-party websites. Please review carefully the third-party's policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Links and Search Results",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
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
                    new TextSpan(text:  "The Site may automatically produce search results that reference or link to products offer across the world wide web. Loot App or Site has no control over these sites or the content within them. Loot App or Site cannot guarantee, represent, or warrant that the content contained in these sites is accurate, legal, and/or inoffensive. Loot App or Site does not endorse the content of any third-party site, nor do we warrant that it will not contain viruses or otherwise impact your computer. By using the Site to search for or link to another site, you agree and understand that you may not make any claim against Loot App or Site for any damages or losses, whatsoever, resulting from your use of the Site to obtain search results or to link to another site.  Loot app or site is an information website only. We show you the best prices of any products on different online stores. We do not know about the reliability and genuineness of each site and the products they are selling. All customers are advised to satisfy themselves of the same before purchasing. If you have a problem with a link from the Site, please notify us at ",
                        style:  GoogleFonts.roboto(
                          color: Colors.grey.shade700,)),
                    TextSpan(text: "app@rpmtechtips.com",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,)),
                    TextSpan(text: ", and we will investigate your claim and take any actions we deem appropriate at our sole discretion.",
                        style: GoogleFonts.roboto(
                          color: Colors.grey.shade700,)),
                  ],
                ),
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Access and Interference",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "You agree that you will not use any robot, spider, other automatic device, or manual process to monitor or copy our Web pages or the content contained thereon or for any other unauthorized purpose without our prior expressed written permission. You agree that you will not use any device, software, or routine to interfere or attempt to interfere with the proper working of the Site. You agree that you will not copy, reproduce, alter, modify, create derivative works from, or publicly display any content (except for your own personal, non-commercial use) from our Web site without the prior expressed written permission of Loot app or site.",
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade700,
                      fontSize: 16),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Unauthorized Use of the Site",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Illegal and/or unauthorized uses of the Site, including, but not limited to, unauthorized framing of or linking to the Site or unauthorized use of any robot, spider, or other automated device on the Site, will be investigated and subject to appropriate legal action, including, without limitation, civil, criminal, and injunctive redress.",
                  style:  GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Violation of the Terms",
                  style:  GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "You agree that monetary damages may not provide a sufficient remedy to Loot App or Site for violations of these terms of use and you consent to injunctive or other equitable relief for such violations.",
                  style:  GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Affiliate Disclaimer",
                  style:  GoogleFonts.roboto(
                    fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Keep in mind that we may receive commissions when you click our links and make purchases. However, this does not impact our reviews and comparisons. We try our best to keep things fair and balanced, in order to help you make the best choice for you. Periodically we will review or mention products and services on my website. If we believe it is a good product, and the merchant selling said product or service offers an affiliate program, we have no issue referring others to the product via an affiliate link, which means we may receive a commission or some form of compensation if you buy the product we recommend.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "*Important Disclaimer: As an Amazon Associate, I earn from qualifying purchases. \n*Important Disclaimer: “Amazon and the Amazon logo are trademarks of Amazon.com, Inc. or its affiliates.”",
                    style:  GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Storage Permission:",
                  style:  GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We use your phone storage to store data that is given by you or that is required by you from our end. These data is user conversion and Screen shot or video share by you with use and required by you from use and it’s stored on your device not on our server. The data sent by you is stored on our server for only 24 Hours to solve your problem with permission to you at the time of sign in for chat. ",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Note: - Chat conversation data is not share with any other third party and will be deleted after 24 hours. ",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Children’s Privacy",
                  style:  GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Changes to This Privacy Policy",
                  style:  GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Your Acceptance of These Terms ",
                  style:  GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "By using this App, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our App or site. Your continued use of the App following the posting of changes to this policy will be deemed your acceptance of those changes.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "CHANGES TO TERMS OF SERVICE",
                  style:  GoogleFonts.roboto(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "You can review the most current version of the Terms of Service at any time at this page.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We reserve the right, at our sole discretion, to update, change or replace any part of these Terms of Service by posting updates and changes to our website. It is your responsibility to check our website periodically for changes. Your continued use of or access to our website or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes.",
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Contact Us",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
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
                    new TextSpan(text:  "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at ",
                        style:  GoogleFonts.roboto(
                          color: Colors.grey.shade700,)),
                    TextSpan(text: "app@rpmtechtips.com",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,)),
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

  const TermsAndConditions();
}
