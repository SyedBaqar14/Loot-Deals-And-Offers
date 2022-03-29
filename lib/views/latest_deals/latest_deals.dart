import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:loot/model/offers_model.dart';
import 'package:loot/provider/latest_deals_provider.dart';
import 'package:loot/provider/updated_offers_provider.dart';
import 'package:loot/views/details_page/deails_page.dart';
import 'package:provider/provider.dart';
import 'package:loot/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../admob_helper.dart';

class LatestOffers extends StatefulWidget {
  @override
  _LatestOffersState createState() => _LatestOffersState();

  const LatestOffers();
}

class _LatestOffersState extends State<LatestOffers> {
  late FToast fToast;
  static int page = 1;
  final List<Data> latestItems = [];
  late List<Object> dataAds; // will store both data + banner ads
  bool isLoading = false;
  bool firstFetch = true;
  bool fetchData = true;
  final ScrollController _scrollController = ScrollController();

  onError(String error) {
    print("error===> $error");
    setState(() {
      fetchData = false;
      // isLoading = false;
      // firstFetch = false;
    });
    _showToast(message: "something went wrong");

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

  fetchUpdatedDeals() async {

    await Provider.of<UpdatedOffersProvider>(context, listen: false)
        .getUpdatedDeals()
        .then((value) {
      if (value is String) {
        print(value);
      } else if (value.status == "success") {
        print(value.status);
        setState(() {
          if (firstFetch) {
            int checkEvenOrOdd = 0;
            bool checkEvenOrOddFirstTime = true;
            latestItems.addAll(value.data);
            dataAds = List.from(latestItems);
            int loadAdd = 2;
            for (int i = 0; i < dataAds.length; i++) {
              //generate a random number from 2 to 18 (+ 1)
              // var ranNumPosition = min + rm.nextInt(9);
              //and add the banner ad to particular index of arraylist
              if (checkEvenOrOddFirstTime) {
                if (i == loadAdd) {
                  print("load add $loadAdd");
                  loadAdd += 6;
                  checkEvenOrOddFirstTime = false;
                  if ((i % 2 == 0)) {
                    print("i is even");
                    dataAds.insert(i, i);
                    dataAds.insert(
                        i,
                        AdmobHelper.getBannerAd(
                            adUnitId: 'ca-app-pub-6205870719398232/4986075123')
                          ..load());
                    checkEvenOrOdd = i + 2;
                  } else {
                    print("i is odd");
                  }
                }
              } else {
                if (i == loadAdd) {
                  checkEvenOrOddFirstTime = false;
                  print("load add $loadAdd");
                  loadAdd += 6;
                  checkEvenOrOddFirstTime = false;
                  if ((checkEvenOrOdd % 2 == 0)) {
                    print("i is even");
                    dataAds.insert(i, i);
                    dataAds.insert(
                        i,
                        AdmobHelper.getBannerAd(
                            adUnitId: 'ca-app-pub-6205870719398232/4986075123')
                          ..load());
                    checkEvenOrOdd = i + 2;
                  } else {
                    print("i is odd");
                  }
                }
              }
            }
          }
          print('totalItems: ${value.data}');
          fetchData = false;
          isLoading = false;
          firstFetch = false;
        });
      }
    }).catchError((Object error) => onError(error.toString()));
  }

  fetchDeals({required int pageNumber}) async {
    await Provider.of<LatestOffersProvider>(context, listen: false)
        .getLatestDeals(pageNumber: pageNumber)
        .then((value) {
      if (value is String) {
        print(value);
      } else if (value.status == "success") {
        print(value.status);
        setState(() {
          if (value.data.isNotEmpty) {
            latestItems.addAll(value.data);
            dataAds = List.from(latestItems);
            // insert admob banner object in between the array list
            // var rm = Random();
            int loadAdd = (dataAds.length - value.data.length).toInt() + 4;
            int loadAddStartFrom = (loadAdd - 4);
            for (int i = loadAddStartFrom; i < dataAds.length; i++) {
              if (i == (loadAdd)) {
                loadAdd += 6;
                if (i % 2 == 0) {
                  dataAds.insert(
                      i,
                      AdmobHelper.getBannerAd(
                          adUnitId: 'ca-app-pub-6205870719398232/4986075123')
                        ..load());
                  dataAds.insert(i, i);
                }
              }
            }
          }
          else {
            _showToast(message: "no more deals");
          }
          print('totalItems: ${value.data}');
          isLoading = false;
          firstFetch = false;
        });
      }
    }).catchError((Object error) => onError(error.toString()));
  }

  Future _loadData() async {
    // perform fetching data delay

    page += 1;
    print("pageNumber: $page");
    fetchDeals(pageNumber: page);

    print("load more");
    // update data and loading status
  }

  static DateTime date1 = DateTime.now();
  String getDifference({required DateTime date1, required String date, required int index, required var productID, required var title}) {

    print('$index) productID ($productID) => date1 $date1');
    print('$index) productID ($productID) => date2 $date');
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    final date2 = inputFormat.parse(date);
    if (date1.difference(date2).inMinutes < 59) {
      print("$index) productID ($productID) => ${date1.difference(date2).inMinutes} mins");
      if(date1.difference(date2).inMinutes > 1) {
        return "${date1.difference(date2).inMinutes} mins";
      } else {
        return "${date1.difference(date2).inMinutes} min";
      }
    } else if (date1.difference(date2).inHours <= 24) {
      print("$index) productID ($productID) => ${date1.difference(date2).inHours} hours");
      if (date1.difference(date2).inHours > 1) {
        return "${date1.difference(date2).inHours} hrs ";
      } else {
        return "${date1.difference(date2).inHours} hr ";
      }
    } else if (date1.difference(date2).inDays > 1) {
      print("$index) productID ($productID) => ${date1.difference(date2).inDays} days");
      return "${date1.difference(date2).inDays} days";
    } else {
      print("$index) productID ($productID) => ${date1.difference(date2).inDays} day");
      return "${date1.difference(date2).inDays} day";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.grey.withOpacity(.2),
          child: fetchData
              ? Center(child: CircularProgressIndicator())
              : firstFetch
              ? Container()
              : RefreshIndicator(
                onRefresh: () {
                  setState(() {
                    page = 2;
                    latestItems.clear();
                    dataAds = [];
                    firstFetch = true;
                    fetchData = true;
                  });
                  return fetchUpdatedDeals();
                },
                child: Column(
                    children: [
                      Expanded(
                        child: NotificationListener(
                          onNotification: (ScrollNotification scrollInfo) {
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
                            controller: _scrollController,
                            itemCount: dataAds.length,
                            shrinkWrap: true,
                            primary: false,
                            padding:
                                const EdgeInsets.only(top: 0, left: 8, right: 8),
                            // childAspectRatio:
                            // getDeviceWidth(context) / getDeviceHeight(context) / 1.05,
                            staggeredTileBuilder: (int index) {
                              if (dataAds[index] is Data) {
                                // print("dataAds[index] is Data: $index");
                                return const StaggeredTile.count(1, 2.3);
                              } else {
                                // print("dataAds[index] is not Data: $index");
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
                                date1 = DateTime.now();
                                String difference =
                                    getDifference(date1: date1, index: index, title: listData.title, date: listData.updatedAt!, productID: listData.productId!);
                                return Card(
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
                                                "${(((int.parse(listData.price!) - int.parse(listData.salePrice!)) / int.parse(listData.price!)) * 100).toInt()} % off",
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Image.network(
                                              listData.logo!,
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      InkWell(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetails(
                                                        productID:
                                                            listData.id!,
                                                    isLatestProductDetails: true,))),
                                        child: Center(
                                          child: Container(
                                            height: 100,
                                            width: getDeviceWidth(context) / 3,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(
                                                    listData.imageUrls!,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 0, left: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(Icons.access_time, size: 15,),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                "$difference",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: Colors.black
                                                        .withOpacity(1)),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(right: 8.0),
                                              child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: IconButton(
                                                    icon: Icon(Icons.share, size: 25,),
                                                    color: Colors.orangeAccent,
                                                    onPressed: () {
                                                      Share.share(listData.url!);
                                                    },
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 8.0,
                                        ),
                                        child: Text(
                                          listData.title!,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 20.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "₹${listData.salePrice!}",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.green.shade500,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Spacer(),
                                            Text(
                                              "₹${listData.price!}",
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                  color:
                                                      Colors.grey.withOpacity(1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16.0, left: 16.0),
                                          child: InkWell(
                                            onTap: () async {
                                              print(
                                                  "launchingffffff ${listData.url}");
                                              //
                                              String url =
                                                  listData.url.toString();

                                              if (await canLaunch(Uri.encodeFull(url)))
                                                await launch(Uri.encodeFull(url));
                                              else
                                                // can't launch url, there is some error
                                                throw "Could not launch $url";
                                              print("launching");
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Colors.orange),
                                              child: Text(
                                                "Buy NOW",
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                );
                              } else if (dataAds[index] is int) {
                                return const SizedBox(
                                  height: 1,
                                );
                              } else {
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
              ),
        ),
        floatingActionButton: firstFetch
        ? Container()
        :Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_circle_up_sharp, color: Colors.white,),
                color: Colors.orangeAccent,
                onPressed: () {
                  _scrollController.animateTo(
                    0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                  );
                  setState(() {
                    page = 2;
                    latestItems.clear();
                    dataAds = [];
                    firstFetch = true;
                    fetchData = true;
                  });
                  fetchUpdatedDeals();
                },
              ),
            )));
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    fetchUpdatedDeals();
  }

  @override
  void dispose() {
    super.dispose();
    page = 2;
    latestItems.clear();
  }
}
