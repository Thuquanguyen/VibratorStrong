import 'package:flutter/material.dart';
import 'package:flutter_app_vibrator_strong/More/View/more_view.dart';
import 'package:flutter_app_vibrator_strong/Setting/View/setting_view.dart';
import 'package:flutter_app_vibrator_strong/Vibration/View/vibration_view.dart';

class NavigationBottomBar extends StatefulWidget {
  static const routeName = '/navigation-bar';

  @override
  _NavigationBottomBarState createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {

  final List<Widget> _pages = <Widget>[
    VibrationView(),
    SettingView(),
    MoreView()
//    AdmodView()
  ];

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(title: Text("Vibration"), icon: Icon(Icons.vibration)),
    BottomNavigationBarItem(title: Text("Setting"), icon: Icon(Icons.settings)),
    BottomNavigationBarItem(
        title: Text("More"), icon: Icon(Icons.more_horiz)),
  ]; // Cre

  final PageStorageBucket _bucket =
  PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(bucket: _bucket,child: IndexedStack(children: _pages, index: _selectedIndex)),
    );
  }

  Widget _bottomNavigationBar(int selectedIndex) =>
      BottomNavigationBar(
          onTap: (int index) {
            setState(() => _selectedIndex = index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(39, 65, 143, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          items: _items);
}
