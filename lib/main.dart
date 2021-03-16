import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/router.dart';

import 'Splat/splat_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: SplatView.routeName,
      onGenerateRoute: Routerr.generateRoute,
      routes: {},
    );
  }
}
