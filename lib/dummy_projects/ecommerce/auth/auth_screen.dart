import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rwad/const.dart';

import '../const/kcolors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _imageNum = 1;

  void _changeTheme() {
    if (_imageNum == 1) {
      _imageNum = 2;
    } else {
      _imageNum = 1;
    }
    setState(() {});
  }

  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    var time = Timer.periodic(oneSec, (Timer t) => _changeTheme());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
              child: Image.asset(
                imagePath + "background$_imageNum.png",
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.only(
              top: 130.0,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome to our",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    )),
                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 36,
                    color: Kcolors.primaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                _btn(text: "Continue with Email or Phone"),
                SizedBox(
                  height: 20,
                ),
                _btn(
                  text: "Create an account",
                  isSecond: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _btn({
    required String text,
    bool isSecond = false,
  }) {
    return Container(
      height: 56,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: isSecond ? Colors.black : Colors.white, fontSize: 16),
        ),
      ),
      decoration: BoxDecoration(
        color: isSecond ? Colors.white : Kcolors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
