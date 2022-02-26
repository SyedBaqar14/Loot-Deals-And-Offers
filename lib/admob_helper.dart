import 'package:google_mobile_ads/google_mobile_ads.dart';


class AdmobHelper {

  // static String get bannerUnit => 'ca-app-pub-6205870719398232/4986075123';

  static initialization(){
    if(MobileAds.instance == null)
    {
      MobileAds.instance.initialize();
      print("admob initialized");
    }
  }

  static BannerAd getBannerAd({required String adUnitId}){
    BannerAd bAd = BannerAd(size: AdSize.banner, adUnitId: adUnitId , listener: BannerAdListener(
        onAdClosed: (Ad ad){
          print("Ad Closed");
        },
        onAdFailedToLoad: (Ad ad,LoadAdError error){
          ad.dispose();
        },
        onAdLoaded: (Ad ad){
          print('Ad Loaded');
        },
        onAdOpened: (Ad ad){
          print('Ad opened');
        }
    ), request: AdRequest());

    return bAd;
  }
}