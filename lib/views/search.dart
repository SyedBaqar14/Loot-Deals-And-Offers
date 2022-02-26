import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loot/model/offers_model.dart';
import 'package:loot/provider/search_provider.dart';
import 'package:loot/views/details_page/deails_page.dart';
import 'package:loot/views/vewb_view_page.dart';
import 'package:provider/provider.dart';
import 'package:loot/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();

  const Search();
}

class _SearchState extends State<Search> {
  static int page = 1;
  final List<Data> searchItems = [];
  bool isLoading = false;
  bool firstFetch = false;

  // dropDownList
  final List<String> dropdownList = ["A","B","C"];
  String? _selectedDropdownValue;
  final TextEditingController searchController = TextEditingController();
  bool latestOffers = true;
  bool trendingOffers = false;
  bool couponCodes = false;
  late FToast fToast;

  fetchSearchResults({required String keyword, required String searchCategory}) async {
    setState(() {
      firstFetch = true;
      searchItems.clear();
    });
    await Provider.of<SearchProvider>(context, listen: false).getSearchResults(keyword: keyword, searchCategory: searchCategory).then((value) {

      if(value.data == null || value.data.isEmpty) {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          print('totalItems: ${value.totalItems}');
          isLoading = false;
          firstFetch = false;
          _showToast(message: "No results found");
          return;
        });
      }
      else if(value is String) {
        print(value);
      } else if(value.status == "success") {
        print(value.status);
        setState(() {
          searchItems.addAll(value.data);
          print('totalItems: ${value.data}');
          isLoading = false;
          firstFetch = false;
        });
      }
    });
  }

  String getDifference(DateTime date1,String date) {
    print('date1 $date1');
    print('date2 $date');
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var date2 = inputFormat.parse(date);
    print("minutes: ${date1.difference(date2).inMinutes}");
    if(date1.difference(date2).inMinutes < 59) {
      return "${date1.difference(date2).inMinutes} mins";
    } else if(date1.difference(date2).inHours <= 24) {
      return "${date1.difference(date2).inHours} hours ";
    } else if(date1.difference(date2).inDays > 1){
      return "${date1.difference(date2).inDays} days";
    } else {
      return "${date1.difference(date2).inDays} day";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: appBarBackgroundColor,
        automaticallyImplyLeading: true,
        title: Text("Search",
          style: GoogleFonts.lato(
        color: Colors.white,
            fontWeight: FontWeight.w500,
           ),),
      ),
        body: Container(
          color: Colors.grey.withOpacity(.2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, left: 8, right: 8, top: 16),
                child: TextField(
                  controller: searchController,
                  onChanged: (val) async {
                    if(latestOffers) {
                      print("latestOffers: $latestOffers");
                      await fetchSearchResults(keyword: val,
                          searchCategory: "latestOffers");
                    } else if(trendingOffers) {
                      print("trendingOffers: $trendingOffers");
                      await fetchSearchResults(keyword: val,
                          searchCategory: "trendingOffers");
                    } else if (couponCodes) {
                      print("couponCodes: $couponCodes");
                      await fetchSearchResults(keyword: val,
                          searchCategory: "couponCodes");
                    }
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Search here",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: kUniversalColor,
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: OutlinedButton(
                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), side: ),
                          style: OutlinedButton.styleFrom(fixedSize: Size.fromWidth(150),
                              backgroundColor: latestOffers? kUniversalColor : Colors.white,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(width: 2.0, color: kUniversalColor,)
                              ),
                              side: const BorderSide(width: 2.0, color: kUniversalColor,
                              )),
                          onPressed: (){
                            setState(() {
                              searchItems.clear();
                              couponCodes = false;
                              trendingOffers = false;
                              latestOffers = true;
                            });
                          }, child: Text("Latest Offers",
                        style: GoogleFonts.lato(
                            color:  latestOffers? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: OutlinedButton(
                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), side: ),
                          style: OutlinedButton.styleFrom(fixedSize: Size.fromWidth(150),
                              backgroundColor: trendingOffers? kUniversalColor : Colors.white,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(width: 2.0, color: kUniversalColor,)
                              ),
                              side: const BorderSide(width: 2.0, color: kUniversalColor,
                              )),
                          onPressed: (){
                            setState(() {
                              searchItems.clear();
                              latestOffers = false;
                              couponCodes = false;
                              trendingOffers = true;
                            });
                          }, child: Text("Trending Offers",
                        style: GoogleFonts.lato(
                            color: trendingOffers? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: OutlinedButton(
                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white), side: ),
                          style: OutlinedButton.styleFrom(fixedSize: Size.fromWidth(150),
                              backgroundColor: couponCodes? kUniversalColor : Colors.white,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(width: 2.0, color: kUniversalColor,)
                              ),
                              side: const BorderSide(width: 2.0, color: kUniversalColor,
                              )),
                          onPressed: (){
                            setState(() {
                              searchItems.clear();
                              latestOffers = false;
                              couponCodes = true;
                              trendingOffers = false;
                            });
                          }, child: Text("Coupon Codes",
                        style: GoogleFonts.lato(
                            color: couponCodes? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )),
                    ),
                  ],
                ),
              ),
              firstFetch
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                child: NotificationListener(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (!isLoading &&
                        scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                      // start loading data
                      // setState(() {
                      //   isLoading = true;
                      // });
                      // _loadData();
                    }
                    return false;
                  },
                  child: StaggeredGridView.countBuilder(
                    itemCount: searchItems.length,
                    shrinkWrap: true,
                    primary: false,
                    padding:
                    const EdgeInsets.only(top: 20, left: 8, right: 8),
                    // childAspectRatio:
                    // getDeviceWidth(context) / getDeviceHeight(context) / 1.05,
                    staggeredTileBuilder: (int index) {
                      return const StaggeredTile.count(1, 2.3);
                    },
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      DateTime date1 = DateTime.now();
                      String difference = getDifference(date1, searchItems[index].updatedAt!);
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
                                      "${(((int.parse(searchItems[index].price!) - int.parse(searchItems[index].salePrice!)) / int.parse(searchItems[index].price!) ) * 100).toInt()} % off",
                                      style: GoogleFonts.lato(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image.network(
                                    searchItems[index].logo!,
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
                              onTap:() => Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ProductDetails(productID: searchItems[index].id!)
                              )),
                              child: Center(
                                child: Container(
                                  height: 100,
                                  width: getDeviceWidth(context) / 3,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                        NetworkImage(searchItems[index].imageUrls!)),
                                  ),
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
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.orangeAccent,
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
                                searchItems[index].title!,
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
                                    "₹${searchItems[index].salePrice!}",
                                    style: GoogleFonts.lato(
                                        color: Colors.green.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Text(
                                    "₹${searchItems[index].price!}",
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
                                    print("launchingffffff ${searchItems[index].url}");
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => WebViewPage(url:searchItems[index].url!,)
                                    ));
                                    print("launching");
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
                              padding: const EdgeInsets.only(bottom: 0, left: 8),
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
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  /*
                  GridView.builder(
                    itemCount: searchItems.length,
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:
                        getDeviceWidth(context) / getDeviceHeight(context) / 1.05,
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      DateTime date1 = DateTime.now();
                      String difference = getDifference(date1, searchItems[index].updatedAt!);
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
                                      "${(((int.parse(searchItems[index].price!) - int.parse(searchItems[index].salePrice!)) / int.parse(searchItems[index].price!) ) * 100).toInt()} % off",
                                      style: GoogleFonts.lato(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Image.network(
                                    searchItems[index].logo!,
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
                              onTap:() => Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => ProductDetails(productID: searchItems[index].id!)
                              )),
                              child: Center(
                                child: Container(
                                  height: 100,
                                  width: getDeviceWidth(context) / 3,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                        NetworkImage(searchItems[index].imageUrls!)),
                                  ),
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
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.orangeAccent,
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
                                searchItems[index].title!,
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
                                    "₹${searchItems[index].salePrice!}",
                                    style: GoogleFonts.lato(
                                        color: Colors.green.shade500,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Spacer(),
                                  Text(
                                    "₹${searchItems[index].price!}",
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
                                    print("launchingffffff ${searchItems[index].url}");
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => WebViewPage(url:searchItems[index].url!,)
                                    ));
                                    print("launching");
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
                    },
                  ),

                   */
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
        )
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    // fetchDeals(pageNumber: page);
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

  @override
  void dispose() {
    page = 1;
    searchItems.clear();
    super.dispose();
  }
}

// returns DropdownMenueItem List
List<DropdownMenuItem<String>> _dropDownItem(List<String> list) {
  return list
      .map((value) => DropdownMenuItem(
    value: value,
    child: Text(value),
  ))
      .toList();
}
