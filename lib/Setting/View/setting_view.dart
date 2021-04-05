
import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/Ads/ad_manager.dart';
import 'package:flutter_app_vibrator_strong/Background/View/background_view.dart';
import 'package:flutter_app_vibrator_strong/ColorText/View/color_text_view.dart';
import 'package:flutter_app_vibrator_strong/FontText/View/font_text_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:vibration/vibration.dart';

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  int indexSelected = 0;
  bool _loader = false;
  var isSelect = -1;

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveStatusAdsPreference("maunen", false);
    saveStatusAdsPreference("sizetext", false);
    saveStatusAdsPreference("mauchu", false);
    RewardedVideoAd.instance
        .load(adUnitId: AdManager.rewardedAdUnitId, targetingInfo: targetingInfo)
        .catchError((e) => print("error in loading 1st time"))
        .then((v) => setState(() => _loader = v));

    RewardedVideoAd.instance.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.closed) {
        print("CLOSE==============================================");
        RewardedVideoAd.instance
            .load(adUnitId: AdManager.rewardedAdUnitId, targetingInfo: targetingInfo)
            .catchError((e) => print("error in loading again"))
            .then((v) => print("VVVVVVV : $v"));
      }else if (event == RewardedVideoAdEvent.completed){
        switch (isSelect){
          case 0:
            saveStatusAdsPreference("maunen", true);
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(BackgroundView.routerName);
            break;
          case 1:
              saveStatusAdsPreference("sizetext", true);
             Navigator.of(context).pop();
             Navigator.of(context).pushNamed(FontTextView.routerName);
            break;
          case 2:
            saveStatusAdsPreference("mauchu", true);
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(ColorTextView.routerName);
            break;
          default:
            break;
        }
        print("Complate=============================================");
      }};
  }

  saveStatusAdsPreference(String key, bool status) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(key, status);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
          return new ExpansionTile(
            title: new Text(
              vehicles[i].title,
              style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic),
            ),
            children: <Widget>[
              new Column(
                children: _buildExpandableContent(i,vehicles[i]),
              ),
            ],initiallyExpanded: (i == 0 || i == 1),
          );
        },
      ),
    );
  }

  _resetData(){
    vehicles[1].checks = [false,false,false,false,false,false,false,false,false,false,false];
    vehicles[1].checks[indexSelected] = true;
  }

  _buildExpandableContent(int index,Vehicle vehicle) {
    List<Widget> columnContent = [];

    for (int i = 0 ; i < vehicle.contents.length ; i++)
      columnContent.add(
        new GestureDetector(child: ListTile(
          title: new Text(
            vehicle.contents[i],
            style: new TextStyle(fontSize: 18.0),
          ),
          trailing: Visibility(child: Icon(Icons.check),
              visible: (vehicle.checks != null && vehicle.checks[i])),
        ),onTap: (){
          if(index == 0){
            showAlertDialog(context,i,(index){
              setState(() {
                isSelect = index;
              });
            });
          }else{
            setState(() {
              indexSelected = i;
              _resetData();
            });

            switch(i){
              case 0:
                Vibration.vibrate(
                  pattern: [500, 300, 400, 300, 300, 300],
                );
                break;
              case 1:
                Vibration.vibrate(
                  pattern: [500, 200, 500, 200, 500, 200,500, 200,500, 200],
                );
                break;
              case 2:
                Vibration.vibrate(duration: 1000);
                break;
              case 3:
                Vibration.vibrate(
                  pattern: [100, 50, 100, 50, 100, 50,100, 50,100, 50,100, 50, 100, 50, 100, 50,100, 50,100, 50,100, 50, 100, 50, 100, 50,100, 50,100, 50],
                );
                showToast(context, "This function work on ${Platform.version == Platform.isAndroid ? "Android" : "IOS"} 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 4:
                Vibration.vibrate(
                  pattern: [100, 50, 100, 50, 100, 20,100, 50,100, 20,100, 50, 100, 20, 100, 50,100, 20,100, 50,100, 20, 100, 20, 100, 20,100, 50,100, 50],
                );
                showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 5:
                Vibration.vibrate(
                  pattern: [100, 10, 100, 20, 100, 20,100, 30,100, 50,100, 50, 100, 50, 100, 50,100, 40,100, 20,100, 20, 100, 50, 100, 50,100, 50,100, 50,100, 10, 100, 20, 100, 20,100, 30,100, 50,100, 50, 100, 50, 100, 50,100, 40,100, 20,100, 20, 100, 50, 100, 50,100, 50,100, 50],
                );
                showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 6:
                Vibration.vibrate(
                  pattern: [100, 30, 100, 30, 100, 30,100, 50,100, 50,100, 50, 100, 30, 100, 30,100, 30,100, 50,100, 50, 100, 30, 100, 30,100, 50,100, 50,100, 30, 100, 30, 100, 30,100, 50,100, 50,100, 50, 100, 30, 100, 30,100, 30,100, 50,100, 50, 100, 30, 100, 30,100, 50,100, 50],
                );
                showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 7:
                Vibration.vibrate(
                  pattern: [100, 10, 100, 10, 100, 20,100, 50,100, 20,100, 10, 100, 20, 100, 20,100, 20,100, 50,100, 20, 100, 30, 100, 30,100, 30,100, 50,100, 10, 100, 10, 100, 20,100, 50,100, 20,100, 10, 100, 20, 100, 20,100, 20,100, 50,100, 20, 100, 30, 100, 30,100, 30,100, 50,100, 10, 100, 10, 100, 20,100, 50,100, 20,100, 10, 100, 20, 100, 20,100, 20,100, 50,100, 20, 100, 30, 100, 30,100, 30,100, 50],
                );
                showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 8:
                Vibration.vibrate(
                  pattern: [100, 10, 100, 20, 100, 20,100, 30,100, 50,100, 50, 100, 50, 100, 50,100, 40,100, 20,100, 20, 100, 50, 100, 50,100, 50,100, 50,100, 10, 100, 20, 100, 20,100, 30,100, 50,100, 50, 100, 50, 100, 50,100, 40,100, 20,100, 20, 100, 50, 100, 50,100, 50,100, 50],
                );
                showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 9:
                Vibration.vibrate(
                  pattern: [200, 50, 100, 50, 200, 50,200, 50,100, 50,200, 50, 100, 50, 100, 50,100, 50,200, 50,100, 50, 200, 50, 200, 50,100, 50,200, 50,200, 50, 100, 50, 200, 50,200, 50,100, 50,200, 50, 100, 50, 100, 50,100, 50,200, 50,100, 50, 200, 50, 200, 50,100, 50,200, 50],
                );
                showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
                break;
              case 10:
              Vibration.vibrate(
                pattern: [100, 40, 100, 40, 100, 40,100, 40,100, 40,100, 40, 100, 40, 100, 40,100, 40,100, 40,100, 40, 100, 40, 100, 40,100, 40,100, 40,100, 40, 100, 40, 100, 40,100, 40,100, 40,100, 40, 100, 40, 100, 40,100, 40,100, 40,100, 40, 100, 40, 100, 40,100, 40,100, 40],
              );
              showToast(context, "This function work on Android 7 or later!!!",gravity: Toast.BOTTOM,duration: 2);
              break;
              default:
                break;
            }
          }
        },),
      );
    return columnContent;
  }
}

class Vehicle {
  final String title;
  List<String> contents = [];
  List<bool> checks = [];

  Vehicle(this.title, this.contents, {this.checks});
}

List<Vehicle> vehicles = [
  new Vehicle(
    'CustomDesign',
    ['Background', 'Font Text', 'Color Text']
  ),
  new Vehicle(
    'Option',
    ['Normal', 'Fast', 'Strong','Funy','Success','Warning','Light','Medium','Heavy','Selection','School'],
    checks: [true,false,false,false,false,false,false,false,false,false,false],
  ),
];

Future<bool> getStatusAdsPreference(String key) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool(key);
    return status;
  } catch (e) {
    print(e);
    return false;
  }
}

void showToast(BuildContext context,String msg, {int duration, int gravity}) {
  Toast.show(msg, context, duration: duration, gravity: gravity);
}

showAlertDialog(BuildContext context,int index,Function(int index) indexChange) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FutureBuilder<bool>(
    future: getStatusAdsPreference(index == 0 ? "maunen" : (index == 1 ? "sizetext" : "mauchu")),
    builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      return FlatButton(
        child: Text("See advertisement"),
        onPressed:  () async {
          await getStatusAdsPreference("");
          switch(index){
            case 0:
              if (snapshot.data){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(BackgroundView.routerName);
              }else{
                indexChange(0);
                await RewardedVideoAd.instance.show().catchError((e) => print("error in showing ad: ${e.toString()}"));
              }
              break;
            case 1:
              if (snapshot.data){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(FontTextView.routerName);
              }else{
                indexChange(1);
                await RewardedVideoAd.instance.show().catchError((e) => print("error in showing ad: ${e.toString()}"));
              }
              break;
            default:
              if (snapshot.data){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(ColorTextView.routerName);
              }else{
                indexChange(2);
                await RewardedVideoAd.instance.show().catchError((e) => print("error in showing ad: ${e.toString()}"));
              }
              break;
          }

        },
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("You need to see the ad to enable this feature. With each ad view this feature can be used for 40 munutes."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}