
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/Background/View/background_view.dart';
import 'package:flutter_app_vibrator_strong/ColorText/View/color_text_view.dart';
import 'package:flutter_app_vibrator_strong/FontText/View/font_text_view.dart';
import 'package:toast/toast.dart';
import 'package:vibration/vibration.dart';

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  int indexSelected = 0;

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
            showAlertDialog(context,i);
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

void showToast(BuildContext context,String msg, {int duration, int gravity}) {
  Toast.show(msg, context, duration: duration, gravity: gravity);
}

showAlertDialog(BuildContext context,int index) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("See advertisement"),
    onPressed:  () {
      switch(index){
        case 0:
          Navigator.of(context).pushNamed(BackgroundView.routerName);
          break;
        case 1:
          Navigator.of(context).pushNamed(FontTextView.routerName);
          break;
        default:
          Navigator.of(context).pushNamed(ColorTextView.routerName);
          break;
      }
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