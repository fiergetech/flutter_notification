import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SwitchPage extends StatefulWidget {
  static const String id = 'switch_screen';

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage>
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
            'Tekan untuk kontrol lampu',
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: GestureDetector(
              onTapDown: _tapDown,
              //onTapUp: _tapUp,
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton(),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: GestureDetector(
              //onTapDown: _tapDown,
              onTapUp: _tapUp,
              child: Transform.scale(
                scale: _scale,
                child: _animatedButton2(),
              ),
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
          'Nyalakan Lampu',
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
              Color.fromARGB(255, 255, 51, 51),
              Color.fromARGB(255, 255, 153, 179),
            ],
          )),
      child: Center(
        child: Text(
          'Matikan Lampu',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
    LedOn();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
    LedOFF();
  }
}
