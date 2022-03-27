import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:loot/admob_helper.dart';
import 'package:loot/provider/LoginProvider.dart';
import 'package:loot/provider/SignupProvider.dart';
import 'package:loot/provider/coupon_codes_provider.dart';
import 'package:loot/provider/email_verification_provider.dart';
import 'package:loot/provider/get_token_provider.dart';
import 'package:loot/provider/latest_deals_provider.dart';
import 'package:loot/provider/product_details_provider.dart';
import 'package:loot/provider/search_provider.dart';
import 'package:loot/provider/trending_offers_provider.dart';
import 'package:loot/provider/updated_offers_provider.dart';
import 'package:loot/routes/custom_routes.dart';
import 'package:loot/routes/routes_names.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

class TemClass {
  static String token = "";
}

setupFireBase() async {
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.getToken().then((token) {
    print('This is Token: ' '${token}');
    TemClass.token = token!;
  });

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupFireBase();
  AdmobHelper.initialization();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: LatestOffersProvider()),
      ChangeNotifierProvider.value(value: DetailsPageProvider()),
      ChangeNotifierProvider.value(value: TrendingOffersProvider()),
      ChangeNotifierProvider.value(value: CouponCodesProvider()),
      ChangeNotifierProvider.value(value: SearchProvider()),
      ChangeNotifierProvider.value(value: UpdatedOffersProvider()),
      ChangeNotifierProvider.value(value: LoginProvider()),
      ChangeNotifierProvider.value(value: SignupProvider()),
      ChangeNotifierProvider.value(value: EmailVerificationProvider()),
      ChangeNotifierProvider.value(value: GetTokenProvider())
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // showDialog(
        //     context: context,
        //     builder: (_) {
        //       return AlertDialog(
        //         title: Text("${notification.title}"),
        //         content: SingleChildScrollView(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [Text("${notification.body}")],
        //           ),
        //         ),
        //       );
        //     });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loot',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.orange,
      ),
      onGenerateRoute: CustomRoutes.allRoutes,
      initialRoute: splash,
      // home: LatestDeals(),
    );
  }
}
