import 'package:flutter/material.dart';

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
          setState(() {
            indexSelected = i;
            _resetData();
          });
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
