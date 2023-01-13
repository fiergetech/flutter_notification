import 'package:flutter/material.dart';
import 'package:flutter_notification/control_page/control_screen.dart';
import 'package:flutter_notification/device_page/example.dart';
import 'package:flutter_notification/device_page/tools_page.dart';
import 'package:flutter_notification/log_in/login_screen.dart';

import '../device_page/device_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch (_index) {
      case 0:
        child = ExampleScreen();
        break;

      case 1:
        child = LoginScreen();
        break;
    }

    return Scaffold(
      //appBar: AppBar(),
      bottomNavigationBar: _bottomTab(),
      body: SizedBox.expand(child: child),
    );
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (int index) => setState(() => _index = index),
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.device_hub), label: ("Devices")),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ("Profile")),
      ],
    );
  }
}
