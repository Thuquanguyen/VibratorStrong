import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Ads/ad_manager.dart';
import 'Splat/splat_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void restartApp(BuildContext context,String key, {String fontStyle,
      Color color}) {
    context.findAncestorStateOfType<_MyAppState>().resetFont(key,fontStyle: fontStyle,color: color);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var font = GoogleFonts.roboto().fontFamily;
  var backgroundMode = Colors.white;
  var textColor = Colors.black;
  BannerAd myBanner;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNamePreference("fonts");
    getNamePreference("background");
    getNamePreference("textcolor");
    FirebaseAdMob.instance.initialize(appId: AdManager.appId);
    myBanner = buildLargeBannerAd()..load();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myBanner.dispose();
    super.dispose();
  }

  BannerAd buildLargeBannerAd() {
    return BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            myBanner
              ..show(
                  anchorType: AnchorType.bottom,anchorOffset: kBottomNavigationBarHeight);
          }
        });
  }

  void resetFont(String key, {String fontStyle, Color color}) {
    saveNamePreference(key,font: fontStyle,color: color);
    getNamePreference(key);
  }

  saveNamePreference(String key, {String font ,Color color}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (font == null) {
        prefs.setInt(key, color.value);
      } else {
        prefs.setString(key, font);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  getNamePreference(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        switch (key) {
          case "fonts":
            String value = prefs.getString(key);
            font = value;
            break;
          case "background":
            Color myColor = Color(prefs.getInt(key) ?? Colors.blue.value);
            backgroundMode = myColor;
            break;
          case "textcolor":
            Color myColor = Color(prefs.getInt(key) ?? Colors.blue.value);
            textColor = myColor;
            break;
          default:
            break;
        }
      });
      return true;
    } catch (e) {
      print(e);
      setState(() {
        font = GoogleFonts.roboto().fontFamily;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
            fontFamily: font, scaffoldBackgroundColor: backgroundMode,textTheme: Theme.of(context).textTheme.apply(
          bodyColor: textColor,
          displayColor: textColor,
            decorationColor: textColor
        )),
        initialRoute: SplatView.routeName,
        onGenerateRoute: Routerr.generateRoute,
        routes: {});
  }
}
