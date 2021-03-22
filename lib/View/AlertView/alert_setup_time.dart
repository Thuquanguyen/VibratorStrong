import 'package:flutter/material.dart';

class AlertSetuptime extends StatefulWidget {
  final void Function(double second,double minute) changeTime;

  const AlertSetuptime({Key key, this.changeTime}) : super(key: key);
  @override
  _AlertSetuptimeState createState() => _AlertSetuptimeState();
}

class _AlertSetuptimeState extends State<AlertSetuptime> {
  var secondController = TextEditingController(text: "10");
  var minusController = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Container(child: Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,children: [
      Text("Time"),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text("Second:"),
          SizedBox(width: 10,),
        Expanded(child: TextField(controller: secondController,keyboardType: TextInputType.number,)),
        Text("Minute:"),
          SizedBox(width: 10,),
        Expanded(child: TextField(controller: minusController,keyboardType: TextInputType.number,)),
      ],),
      SizedBox(height: 15,),
      Divider(height: 1),
      SizedBox(height: 15,),
      RaisedButton(onPressed: (){
        widget.changeTime(double.parse(secondController.text),double.parse(minusController.text));
        Navigator.of(context).pop();
      }, child: Text("Done",style: TextStyle(color: Colors.white),),color: Colors.purple)
    ],));
  }
}
