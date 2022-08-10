import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class SwitchPage extends StatefulWidget {
  static const String id = 'switch_screen';

  @override
  _SwitchPageState createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  final DBref = FirebaseDatabase.instance.reference();

  bool isSwitched;
  bool newVal;

  void LedOn() async {
    await DBref.child("LED_FLUTTER")
        //.child("Device1")
        //.child("LED_STATUS")
        .update({'DATA': 'TRUE'});
  }

  void LedOFF() async {
    await DBref.child("LED_FLUTTER")
        //.child("Device1")
        //.child("LED_STATUS")
        .update({'DATA': 'FALSE'});
  }

  void getStatus() async {
    String newValue = (await FirebaseDatabase.instance
            .reference()
            .child("LED_FLUTTER/DATA")
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
    getStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              FlatButton(
                  onPressed: () async {
                    await getStatus();
                  },
                  child: Text('KONTROL LAMPU')),
              FlatButton(
                  onPressed: () {
                    LedOn();
                    print('ON');
                  },
                  child: Text('LED ON')),
              FlatButton(
                  onPressed: () {
                    LedOFF();
                    print('OFF');
                  },
                  child: Text('LED OFF')),
              Switch(
                value: isSwitched,
                onChanged: (value) async {
                  await _handleSwitch(value);
                },
              ),
            ],
          )),
    );
  }
}
