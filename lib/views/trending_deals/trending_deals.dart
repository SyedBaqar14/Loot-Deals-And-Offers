import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:loot/config/asset_config.dart';
import 'package:loot/model/offers_model.dart';
import 'package:loot/provider/latest_deals_provider.dart';
import 'package:loot/provider/trending_offers_provider.dart';
import 'package:loot/provider/updated_offers_provider.dart';
import 'package:loot/views/details_page/deails_page.dart';
import 'package:provider/provider.dart';
import 'package:loot/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../admob_helper.dart';
import '../vewb_view_page.dart';

class TrendingOffers extends StatefulWidget {
  @override
  _TrendingOffersState createState() => _TrendingOffersState();

  const TrendingOffers();
}

class _TrendingOffersState extends State<TrendingOffers> {
  static int page = 1;
  final List<Data> trendingItems = [];
  late List<Object> dataAds; // will store both data + banner ads
  bool isLoading = false;
  bool firstFetch = true;
  static bool fetchMoreUpdatedProducts = false;
  late FToast fToast;

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
          Text(message, style: TextStyle(color: Colors.white),),
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

  fetchDeals({required int pageNumber}) async {
    await Provider.of<TrendingOffersProvider>(context, listen: false)
        .getTrendingOffers(pageNumber: pageNumber)
        .then((value) {
      if (value is String) {
        print(value);
      } else if (value.status == "success") {
        Future.delayed(Duration(microseconds: 100));
        print(value.status);
        setState(() {
          trendingItems.addAll(value.data);
          dataAds = List.from(trendingItems);
          // insert admob banner object in between the array list
          // var rm = Random();
          int loadAdd = (dataAds.length - value.data.length).toInt() + 4;
          int loadAddStartFrom = (loadAdd - 4);
          for (int i = loadAddStartFrom; i < dataAds.length; i++) {
            //generate a random number from 2 to 18 (+ 1)
            // var ranNumPosition = min + rm.nextInt(9);
            //and add the banner ad to particular index of arraylist
            if (i == (loadAdd)) {
              loadAdd += 6;
              if (i % 2 == 0) {
                dataAds.insert(i, AdmobHelper.getBannerAd(adUnitId: 'ca-app-pub-3940256099942544/6300978111')..load());
                dataAds.insert(i, i);
              }
            }
          }

          print('totalItems: ${value.data}');
          isLoading = false;
          firstFetch = false;
        });
      }
    });
  }

  Future _loadData() async {
    // perform fetching data delay

    page += 1;
    print("pageNumber: $page");
    fetchDeals(pageNumber: page);

    // await new Future.delayed(new Duration(seconds: 2));

    print("load more");
    // update data and loading status
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
    return Scaffold(
        body: Container(
          color: Colors.grey.withOpacity(.2),
          child: firstFetch
              ? Center(child: CircularProgressIndicator())
              : Column(
            children: [
              Expanded(
                child: NotificationListener(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels > 1200.0) {
                      fetchMoreUpdatedProducts = true;
                      print("scrollInfo: ${scrollInfo.metrics.pixels}, true");
                    }
                    if(fetchMoreUpdatedProducts && scrollInfo.metrics.pixels < 2.0) {
                      print("scrollInfo: ${scrollInfo.metrics.pixels}, fetchMoreUpdatedProducts");
                      fetchMoreUpdatedProducts = false;
                      Future.delayed(Duration(minutes: 3)).then((value) {
                        if (scrollInfo.metrics.pixels <= 50.0) {
                          _loadData();
                        }
                      });
                    }
                    if (!isLoading &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      // start loading data
                      setState(() {
                        isLoading = true;
                      });
                      _loadData();
                    }
                    return false;
                  },
                  child: StaggeredGridView.countBuilder(
                    itemCount: dataAds.length,
                    shrinkWrap: true,
                    primary: false,
                    padding:
                    const EdgeInsets.only(top: 20, left: 8, right: 8),
                    // childAspectRatio:
                    // getDeviceWidth(context) / getDeviceHeight(context) / 1.05,
                    staggeredTileBuilder: (int index) {
                      if (dataAds[index] is Data) {
                        print("dataAds[index] is Data: $index");
                        return const StaggeredTile.count(1, 2.3);
                      } else {
                        print("dataAds[index] is not Data: $index");
                        return const StaggeredTile.count(2, 0.4);
                        // return const StaggeredTile.count(1, 1);
                      }
                    },
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      if (dataAds[index] is Data) {
                        Data listData = dataAds[index] as Data;
                        print("image: ${listData.imge}");
                        DateTime date1 = DateTime.now();
                        String difference =
                        getDifference(date1, listData.createdAt!);
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0, top: 8.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: Colors.orange),
                                      child: Text(
                                        "${(((int.parse(trendingItems[index].mrp!) - int.parse(trendingItems[index].price!)) / int.parse(trendingItems[index].mrp!) ) * 100).toInt()} % off",
                                        style: GoogleFonts.lato(
                                            color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Image.asset(AssetConfig.kLootBag, width: 24, height: 24,)
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  height: 100,
                                  width: getDeviceWidth(context) / 3,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                        NetworkImage(trendingItems[index].imge!)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      icon: Icon(Icons.share),
                                      color: Colors.orangeAccent,
                                      onPressed: () {
                                        Share.share('Some text');
                                      },
                                    )),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                ),
                                child: Text(
                                  trendingItems[index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, right: 20.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "₹${trendingItems[index].price!}",
                                      style: GoogleFonts.lato(
                                          color: Colors.green.shade500,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Spacer(),
                                    Text(
                                      "₹${trendingItems[index].mrp!}",
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          decoration: TextDecoration.lineThrough,
                                          color: Colors.grey.withOpacity(1)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: InkWell(
                                    onTap:()async{
                                      print("launchingffffff ${listData.url}");

                                      String url = listData.url.toString();
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        // can't launch url, there is some error
                                        _showToast(message: "something went wrong");
                                        throw "Could not launch $url";
                                      }
                                      // Navigator.push(context, MaterialPageRoute(
                                      //     builder: (context) => WebViewPage(url:trendingItems[index].url!,)
                                      // ));
                                      // print("launching");
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.orange),
                                      child: Text(
                                        "Buy NOW",
                                        style: GoogleFonts.lato(
                                            color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10, left: 8),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "$difference",
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
                              ),
                            ],
                          ),
                        );
                      } else if (dataAds[index] is int) {
                        return const SizedBox(
                          height: 1,
                        );
                      } else {
                        // if dataads[index] is object (ads) then show container with adWidget
                        final Container adcontent = Container(
                          child: AdWidget(
                            ad: dataAds[index] as BannerAd,
                            key: UniqueKey(),
                          ),
                          height: 10,
                        );
                        return adcontent;
                      }
                    },
                  ),
                ),
              ),
              Container(
                height: isLoading ? 50.0 : 0,
                color: Colors.transparent,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchDeals(pageNumber: page);
  }

  @override
  void dispose() {
    super.dispose();
    page = 1;
    trendingItems.clear();
    fetchMoreUpdatedProducts = false;
  }
}
