import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/router.dart';

import '../navigation_bottom.dart';

class SplatView extends StatefulWidget {
  static const routeName = '/splat';

  @override
  _SplatScreenState createState() => _SplatScreenState();
}

class _SplatScreenState extends State<SplatView> {
  Future<int> _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intentScreen(3);
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 813;
    return FutureBuilder(
        builder: (context, snapshot) => Scaffold(
            backgroundColor: Color.fromRGBO(245, 245, 245, 1),
            body: Container(
              child: Image.asset(
                "assets/images/ic_splat.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            )),
        future: _counter);
  }

  // Function
  Future intentScreen(int count) {
    return new Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => NavigationBottomBar()),
          (Route<dynamic> route) => false);
    });
  }
}
