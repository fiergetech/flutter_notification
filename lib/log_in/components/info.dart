import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_notification/widgets/button_login.dart';
import 'package:flutter_notification/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Credentials extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailTextController =
      TextEditingController(text: '');
  final TextEditingController _passTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: const AssetImage("images/avatar.png"),
              backgroundColor: Colors.orange.shade800,
            ),
          ),*/
          const SizedBox(
            height: 15.0,
          ),
          InputField(
            hintText: "Enter Email",
            icon: Icons.email_rounded,
            obscureText: false,
            textEditingController: _emailTextController,
          ),
          const SizedBox(
            height: 15.0,
          ),
          InputField(
            hintText: "Enter Password",
            icon: Icons.lock,
            obscureText: true,
            textEditingController: _passTextController,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // forget password
                },
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60.0,
            child: ButtonLogin(
                text: "Login",
                color1: Colors.red,
                color2: Colors.redAccent,
                press: () async {
                  try {
                    await _auth.signInWithEmailAndPassword(
                      email: _emailTextController.text.trim().toLowerCase(),
                      password: _passTextController.text.trim(),
                    );
                    //Homescreen
                  } catch (error) {
                    Fluttertoast.showToast(msg: error.toString());
                  }
                }),
          )
        ],
      ),
    );
  }
}
