import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:loot/admob_helper.dart';
import 'package:loot/config/constants.dart';
import 'package:loot/model/product_details_model.dart';
import 'package:loot/provider/product_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetails extends StatefulWidget {
  final String productID;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();

  const ProductDetails({required this.productID});
}

class _ProductDetailsState extends State<ProductDetails> {
  late Data data;
  late String difference;
  bool isLoading = true;

  fetchDeals({required String productID}) async {
    await Provider.of<DetailsPageProvider>(context, listen: false)
        .getDetailsPage(productID: productID)
        .then((value) {
      if (value is String) {
        print(value);
      } else if (value.status == "success") {
        print(value.status);
        setState(() {
          data = value.data;
          print(data.id);
          isLoading = false;
        });
      }
    });
  }

  String getDifference(DateTime date1, String date) {
    print('date1 $date1');
    print('date2 $date');
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var date2 = inputFormat.parse(date);
    print("minutes: ${date1.difference(date2).inMinutes}");
    if (date1.difference(date2).inMinutes < 59) {
      return "${date1.difference(date2).inMinutes} mins";
    } else if (date1.difference(date2).inHours <= 24) {
      return "${date1.difference(date2).inHours} hours ";
    } else if (date1.difference(date2).inDays > 1) {
      return "${date1.difference(date2).inDays} days";
    } else {
      return "${date1.difference(date2).inDays} day";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      DateTime date1 = DateTime.now();
      difference = getDifference(date1, data.updatedAt!);
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: appBarBackgroundColor),
        centerTitle: true,
        title: Text(
          'Loot',
          style: TextStyle(color: kTextTitleColor),
        ),
        backgroundColor: appBarBackgroundColor,
        actions: <Widget>[
          InkWell(
            onTap: () {
              // showCupertinoDialog(
              //     context: context,
              //     builder: (context) {
              //       return CupertinoAlertDialog(
              //         title: const Text("Logout"),
              //         content:
              //         const Text("Are your sure you want to logout"),
              //         actions: [
              //           TextButton(
              //               onPressed: () => Navigator.of(context).pop(),
              //               child: Text("No")),
              //           TextButton(
              //               onPressed: () => Navigator.pushAndRemoveUntil(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) => SignIn()),
              //                       (route) => false),
              //               child: Text("Yes")),
              //         ],
              //       );
              //     });
            },
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                // showCupertinoDialog(
                //     context: context,
                //     builder: (context) {
                //       return CupertinoAlertDialog(
                //         title: const Text("Logout"),
                //         content:
                //         const Text("Are your sure you want to logout"),
                //         actions: [
                //           TextButton(
                //               onPressed: () => Navigator.of(context).pop(),
                //               child: Text("No")),
                //           TextButton(
                //               onPressed: () => Navigator.pushAndRemoveUntil(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: (context) => SignIn()),
                //                       (route) => false),
                //               child: Text("Yes")),
                //         ],
                //       );
                //     });
              },
              child: const Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, top: 8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.orange),
                            child: Text(
                              "${(((int.parse(data.price!) - int.parse(data.salePrice!)) / int.parse(data.price!)) * 100).toInt()} % off",
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.network(
                              data.logo!,
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      data.imageUrls!,
                      height: getDeviceHeight(context) / 3,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            data.title!,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Spacer(),
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.share),
                              color: Colors.orangeAccent,
                              onPressed: () {
                                Share.share('Some text');
                              },
                            )),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            difference,
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black.withOpacity(1)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹${data.salePrice}",
                          style: GoogleFonts.lato(
                              color: Colors.green.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "₹${data.price}",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.withOpacity(1)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: InkWell(
                          onTap: () async {
                            String url = data.url.toString();
                            if (await canLaunch(url))
                              await launch(url);
                            else
                              // can't launch url, there is some error
                              throw "Could not launch $url";
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.orange),
                            child: Center(
                              child: Text(
                                "Buy NOW",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: AdWidget(
                        ad: AdmobHelper.getBannerAd(adUnitId: 'ca-app-pub-3940256099942544/6300978111')..load(),
                        key: UniqueKey(),
                      ),
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    data.logo!.contains("amazon")
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How to get this Offer?",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: new TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: "•	Click On ",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: "Buy Now",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: " Button to go to offer page.",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ])),
                              Text(
                                "•	Check for latest price & stock availability.\n•	Add to cart & select/update shipping info.\n•	Make payment.",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text("•	Subscribe to ",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)),
                                  InkWell(
                                    onTap: () async {
                                      // bool isAppExisit = await LaunchApp.isAppInstalled(
                                      //     androidPackageName: 'com.amazon.mShop.android.shopping'
                                      // );
                                      // print(isAppExisit);
                                      // await LaunchApp.openApp(
                                      //   androidPackageName: 'com.amazon.mShop.android.shopping',
                                      //   openStore: false
                                      // );
                                      const url =
                                          "https://www.amazon.in/amazonprime?_encoding=UTF8&primeCampaignId=prime_assoc_FT_IN&linkCode=ll2&tag=rpmproduction-21&linkId=341ea9cc77a25c2eacfe7e5d17165daf&language=en_IN&ref_=as_li_ss_tl";
                                      if (await canLaunch(url))
                                        await launch(url);
                                      else
                                        // can't launch url, there is some error
                                        throw "Could not launch $url";
                                    },
                                    child: Text("Amazon Prime ",
                                        style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Flexible(
                                    child: Text(
                                        "to get free shipping on all Orders.",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Affiliate Disclaimer: -",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "*Important Disclaimer: As an Amazon Associate, we earn from qualifying purchases.",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "*Important Disclaimer: Amazon and the Amazon logo are trademarks of Amazon.com, Inc. or its affiliates.",
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "How to get this Offer?",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                  text: new TextSpan(
                                      // Note: Styles for TextSpans must be explicitly defined.
                                      // Child text spans will inherit styles from parent
                                      style: new TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: "•	Click On ",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text: "Buy Now",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: " Button to go to offer page.",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                  ])),
                              Text(
                                "•	Check for latest price & stock availability.\n•	Add to cart & select/update shipping info.\n•	Make payment.",
                                style: GoogleFonts.lato(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void initState() {
    fetchDeals(productID: widget.productID);
    super.initState();
  }
}
