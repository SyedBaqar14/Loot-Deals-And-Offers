

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loot/components/side_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Privacy Policy",
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
                  child: Text('Privacy policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange),)
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "If anyone decided to use our Service they have to agree with our Policies, Terms and Condition with the collection, use, and disclosure of Personal Information.",
                  style: GoogleFonts.lato(
                      color: Colors.grey.shade700,
                      fontSize: 14),
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
                    new TextSpan(text: "We built the ",
                        style:  GoogleFonts.lato(
                          color: Colors.grey.shade700,)),
                    TextSpan(text: "Loot ",
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.65),)),
                    TextSpan(text: "site or app as a FREE Service. This Service is provided by RPM Tech Tips at no cost and is intended for use as is.",
                        style: GoogleFonts.lato(
                          color: Colors.grey.shade700,)),
                  ],
                ),
              ),
            ),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.",
                  style: GoogleFonts.lato(
                      color: Colors.grey.shade700,
                      fontSize: 16),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Information Collection and Use",
                  style:  GoogleFonts.lato(
                    color: Colors.black,
                  fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request is will be retained by us and used as described in this privacy policy.",
                  style:  GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We may collect personal identification information from Users in a variety of ways, including, but not limited to, when users install our app, register on the site or app, subscribe to the newsletter, and in connection with other activities, services, features or resources we make available on our site or app.",
                  style:  GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We will collect personal identification information from Users only if they voluntarily submit or permits / allow us to access such information to us. Users can always refuse to supply personally identification information, except that it may prevent them from engaging in certain App related activities.",
                  style: GoogleFonts.lato(
                      color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We may collect non-personal identification information about Users whenever they interact with our site or app. Non-personal identification information may include the type of mobile and technical information about Users means of connection to our site or app, such as the operating system and the Internet service providers utilized and other similar information.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We may collect and use Users personal information for the following purposes:",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "To improve our site or app: We may use feedback, suggestion you provide to improve our products and services.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "To run a promotion, contest or other Site feature: To send User’s information they agreed to receive about topics we think will be of interest to them. ",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We do not sell, trade, or rent Users personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above. We may share your information with these third parties for those limited purposes provided that you have given us your permission",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "The site or app does use third party services that may collect information used to identify you.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Link to privacy policy of third-party service providers used by the site or app ",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Google Play Services ",
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "AdMob ",
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Log Data",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We want to inform you that whenever you use our Service, in a case of an error in the site or app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics. ",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Cookies",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your device internal memory. ",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "This Service does not use these “cookies” explicitly. However, the site or app may use third party code and libraries that use “cookies” to collection information and to improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Service Providers",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We may employ third-party companies and individuals due to the following reasons:",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• To facilitate our Service:",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• To provide the Service on our behalf:",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• To perform Service-related services: or",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "• To assist us in analyzing how our Service is used.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose. ",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Security",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security. ",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Links to Other Sites",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Changes to this privacy policy",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Loot App has the discretion to update this privacy policy at any time. When we do, we will post a notification on the main page of our Site or app, revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  "Your acceptance of these terms",
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
            Padding(
                padding:
                EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 0),
                child: Text(
                  " By using our site or app, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our site or app. Your continued use of the site or app following the posting of changes to this policy will be deemed your acceptance of those changes.",
                  style: GoogleFonts.lato(
                    color: Colors.grey.shade700,),
                )),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  const PrivacyPolicy();
}
