import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/View/AlertView/alert_setup_time.dart';

class VibrationView extends StatefulWidget {
  @override
  _VibrationViewState createState() => _VibrationViewState();
}

class _VibrationViewState extends State<VibrationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child:
      Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Icon(Icons.play_circle_outline,size: 150),
        Text("Start"),
        SizedBox(height: 50),
        Row(children: [
          RaisedButton(onPressed: (){
            _showAlert(context);
          },child: Text("Time",style: TextStyle(color: Colors.black),),color: Colors.green),
          SizedBox(width: 50,),
          RaisedButton(onPressed: (){

          },
              child: Text("Lock",style: TextStyle(color: Colors.black)),color: Colors.green)
        ],mainAxisAlignment: MainAxisAlignment.center,)
      ],)),
    );
  }
}

void _showAlert(BuildContext context) {
  AlertDialog dialog = new AlertDialog(
    content: new Container(
      width: 260.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
      ),
      child: AlertSetuptime(changeTime: (second,minute){
        print("second: $second");
      },),
    ),
  );

  showDialog(context: context, child: dialog);
}