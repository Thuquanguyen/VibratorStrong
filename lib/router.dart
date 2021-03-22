import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_vibrator_strong/Background/View/background_view.dart';
import 'package:flutter_app_vibrator_strong/ColorText/View/color_text_view.dart';
import 'package:flutter_app_vibrator_strong/FontText/View/font_text_view.dart';
import 'package:flutter_app_vibrator_strong/Infomation/View/infomation_app.dart';

import 'Splat/splat_view.dart';
import 'navigation_bottom.dart';

const String initialRoute = "login";

class Routerr {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplatView());
      case SplatView.routeName:
        return SlideRightRoute(widget: SplatView());
      case NavigationBottomBar.routeName:
        return SlideRightRoute(widget: NavigationBottomBar());
      case InfomationApp.routerName:
        return SlideRightRoute(widget: InfomationApp());
      case BackgroundView.routerName:
        return SlideRightRoute(widget: BackgroundView());
      case ColorTextView.routerName:
        return SlideRightRoute(widget: ColorTextView());
      case FontTextView.routerName:
        return SlideRightRoute(widget: FontTextView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;

  SlideRightRoute({this.widget})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}