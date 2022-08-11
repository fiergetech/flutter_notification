import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonLogin extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color1;
  final Color color2;

  ButtonLogin({
    this.text,
    this.press,
    this.color1,
    this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.blue,
                    Colors.blueAccent,
                  ]),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(3, 3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Color(0xffff99cc),
                ),
                BoxShadow(
                  offset: Offset(-5, -5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Colors.blue,
                ),
              ]),
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.w800),
          )),
        ),
      ),
    );
  }
}
