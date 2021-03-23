import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/Background/Model/background_model.dart';

import '../../main.dart';

class BackgroundView extends StatefulWidget {
  static const String routerName = '/background_view';
  @override
  _BackgroundViewState createState() => _BackgroundViewState();
}

class _BackgroundViewState extends State<BackgroundView> {
  List<BackgroundModel> fonts = [BackgroundModel("white",Colors.white),
    BackgroundModel("black",Colors.black),
    BackgroundModel("red",Colors.red),
    BackgroundModel("redAccent",Colors.redAccent),
    BackgroundModel("grey",Colors.grey),
    BackgroundModel("black87",Colors.black87),
    BackgroundModel("greenAccent",Colors.greenAccent),
    BackgroundModel("green",Colors.green),
    BackgroundModel("purple",Colors.purple),
    BackgroundModel("blueGrey",Colors.blueGrey),
    BackgroundModel("blue",Colors.blue),
    BackgroundModel("amberAccent",Colors.amberAccent),
    BackgroundModel("brown",Colors.brown),
    BackgroundModel("cyan",Colors.cyan),
    BackgroundModel("indigo",Colors.indigo),
    BackgroundModel("purpleAccent",Colors.purpleAccent),
    BackgroundModel("deepPurple",Colors.deepPurple),
    BackgroundModel("deepOrange",Colors.deepOrange),
    BackgroundModel("deepOrangeAccent",Colors.deepOrangeAccent),
    BackgroundModel("lightGreenAccent",Colors.lightGreenAccent),
    BackgroundModel("lightBlue",Colors.lightBlue),
    BackgroundModel("teal",Colors.teal),
    BackgroundModel("pink",Colors.pink)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Check Color background"),leading: IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.arrow_back_ios))),
      body: Container(child: ListView.builder(itemBuilder: (context,index){
        return Container(height: 50,child: GestureDetector(child: Column(children: [
          Text(fonts[index].nameColor,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          Divider(height: 1,)
        ],),onTap: (){
          MyApp.restartApp(context,"background",color: fonts[index].color);
        },),);
      },itemCount: fonts.length)),);
  }
}
