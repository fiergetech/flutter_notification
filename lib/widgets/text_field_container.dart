import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  TextFieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white,
                Color(0xffff99cc),
              ]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(-2, -2),
              spreadRadius: 1,
              blurRadius: 4,
              color: Colors.blue,
            ),
            BoxShadow(
              offset: Offset(2, 2),
              spreadRadius: 1,
              blurRadius: 4,
              color: Color(0xffff99cc),
            ),
          ]),
      child: child,
    );
  }
}
