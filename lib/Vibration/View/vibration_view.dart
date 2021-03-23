import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/Ads/ad_manager.dart';
import 'package:flutter_app_vibrator_strong/View/AlertView/alert_setup_time.dart';
import 'package:vibration/vibration.dart';


class VibrationView extends StatefulWidget {
  @override
  _VibrationViewState createState() => _VibrationViewState();
}

class _VibrationViewState extends State<VibrationView>{
  var isStart = true;
  var isLook = false;
  int miliSecond = 0;
  bool _isRewardedAdReady;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // TODO: Initialize _isRewardedAdReady
    _isRewardedAdReady = false;

    // TODO: Set Rewarded Ad event listener
    RewardedVideoAd.instance.listener = _onRewardedAdEvent;

    // TODO: Load a Rewarded Ad
    _loadRewardedAd();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    RewardedVideoAd.instance.listener = null;
    super.dispose();
  }
  void _loadRewardedAd() {
    RewardedVideoAd.instance.load(
      targetingInfo: MobileAdTargetingInfo(),
      adUnitId: AdManager.rewardedAdUnitId,
    );
  }

  // TODO: Implement _onRewardedAdEvent()
  void _onRewardedAdEvent(RewardedVideoAdEvent event,
      {String rewardType, int rewardAmount}) {
    switch (event) {
      case RewardedVideoAdEvent.loaded:
        setState(() {
          _isRewardedAdReady = true;
        });
        break;
      case RewardedVideoAdEvent.closed:
        setState(() {
          _isRewardedAdReady = false;
        });
        _loadRewardedAd();
        break;
      case RewardedVideoAdEvent.failedToLoad:
        setState(() {
          _isRewardedAdReady = false;
        });
        print('Failed to load a rewarded ad');
        break;
      case RewardedVideoAdEvent.rewarded:
        // QuizManager.instance.useHint();
        break;
      default:
      // do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:
      Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        GestureDetector(child:Icon(isStart ? Icons.play_circle_outline : Icons.pause_circle_outline,size: 150),onTap: (){
          if(isStart){
            List <int>patterns = <int>[];
            for (int i = 0; i < (miliSecond/100);i++){
              patterns.add(100);
              patterns.add(50);
            }
            print("pattern : $patterns");
            Vibration.vibrate(
              pattern: patterns,
            );
          }else{
            Vibration.cancel();
            print("caa");
          }
          setState(() {
            isStart = !isStart;
            print("start : $isStart");
          });
        },),
        Text("${isStart ? "Start" : "Running"}"),
        SizedBox(height: 50),
        Row(children: [
          RaisedButton(onPressed: (){
            if (!isLook){
              _showAlert(context,(milisecond){
                setState(() {
                  miliSecond = milisecond.toInt();
                });
              });
            }
          },child: Text("Time",style: TextStyle(color: isLook ? Colors.grey : Colors.black),),color: isLook ? Colors.greenAccent:Colors.green),
          SizedBox(width: 50,),
          RaisedButton(onPressed: (){
            setState(() {
              isLook = !isLook;
            });
            if (isLook){
              setState(() {
                miliSecond = miliSecond * 10;
              });
            }else {
              setState(() {
                miliSecond = (miliSecond / 10).toInt();
              });
            }
          },
              child: Text("${isLook ? "Unlock" : "Lock"}",style: TextStyle(color: Colors.black)),color: Colors.green)
        ],mainAxisAlignment: MainAxisAlignment.center,)
      ],)),
    );
  }
}

Future<void> _initAdMob() {
  // TODO: Initialize AdMob SDK
  return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
}

void _showAlert(BuildContext context, Function(double milisecond) timeChange) {
  AlertDialog dialog = new AlertDialog(
    content: new Container(
      width: 260.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
      ),
      child: AlertSetuptime(changeTime: (second,minute){
        timeChange((minute * 60 + second)*1000);
      },),
    ),
  );

  showDialog(context: context , builder: (BuildContext context) => dialog);
}