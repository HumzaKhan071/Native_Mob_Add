import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NativeAd? nativeAd;

  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/1044960115",
      factoryId: "listTile",
      listener: NativeAdListener(onAdLoaded: (_) {
        setState(() {
          isLoaded = true;
        });
        print("Ad Loaded");
      }, onAdFailedToLoad: (ad, error) {
        print("Failed to load ");
        ad.dispose();
      }),
      request: AdRequest(),
    );
    nativeAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 500,
        child: isLoaded
            ? AdWidget(ad: nativeAd!)
            : Center(
                child: Text("Add is Loading..."),
              ),
      ),
    );
  }
}
