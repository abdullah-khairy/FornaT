import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../classat_and_variable/ad_helper.dart';

class MyBunnerAds extends StatefulWidget {

  @override
  State<MyBunnerAds> createState() => _MyBunnerAdsState();
}

class _MyBunnerAdsState extends State<MyBunnerAds> {
   BannerAd? _bannerAd;
  @override
  void initState() {

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }
  @override
  Widget build(BuildContext context)=> _bannerAd != null?
     Container(
       width: _bannerAd!.size.width.toDouble(),
       height: _bannerAd!.size.height.toDouble(),
       child: AdWidget(ad: _bannerAd!),
     ):Container();
       @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }
  
}