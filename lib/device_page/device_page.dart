import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_notification/control_page/control_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'cctv.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final DBref = FirebaseDatabase.instance.reference();
  AnimationController _controller;
  double _scale;

  bool isSwitched;
  bool newVal;

  void LedOn() async {
    await DBref.update({'LED_FLUTTER': 'TRUE'});
    //.child("Device1")
    //.child("LED_STATUS")
  }

  void LedOFF() async {
    await DBref.update({'LED_FLUTTER': 'FALSE'});
    //.child("Device1")
    //.child("LED_STATUS")
  }

  void getStatus() async {
    String newValue = (await FirebaseDatabase.instance
            .reference()
            .child("LED_FLUTTER")
            .once())
        .value;
    print(isSwitched);
    print(newValue);
    setState(() {
      if (newValue == 'TRUE') {
        isSwitched = true;
      } else {
        isSwitched = false;
      }
    });
  }

  void _handleSwitch(bool value) async {
    if (value) {
      await LedOn();
    } else {
      await LedOFF();
    }
    setState(() {
      isSwitched = value;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    getStatus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Hai👋',
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
          Text(
            'Mau monitor apa hari ini?',
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: ElevatedButton(
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton(),
              ),
              onPressed: () {
                _nextscreen(context);
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: ElevatedButton(
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton2(),
              ),
              onPressed: () {
                _nextscreen2(context);
              },
            ),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) async {
              await _handleSwitch(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _animatedButton() {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 2, 210, 113),
              Color.fromARGB(255, 153, 255, 253),
            ],
          )),
      child: Center(
        child: Text(
          'Lampu Teras',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  Widget _animatedButton2() {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 2, 210, 113),
              Color.fromARGB(255, 153, 255, 253),
            ],
          )),
      child: Center(
        child: Text(
          'CCTV',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  void _nextscreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SwitchPage()));
  }

  void _nextscreen2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CctvPage()));
  }
}
