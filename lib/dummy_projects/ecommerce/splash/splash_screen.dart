import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rwad/const.dart';
import 'package:rwad/dummy_projects/ecommerce/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _color = Color(0xFF40AA54);
  int imageNum = 1;

  void _changeTheme() {
    if (imageNum == 1) {
      _color = Colors.white;
      imageNum = 2;
    } else {
      _color = Color(0xFF40AA54);
      imageNum = 1;
    }

    setState(() {});
  }

  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    var time = Timer.periodic(oneSec, (Timer t) => _changeTheme());
    Future.delayed(Duration(seconds: 4)).then((val) {
      time.cancel();
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) => OnboardingScreen()),
      //   (Route<dynamic> route) => false,
      // );
      Get.offAll(OnboardingScreen());
    });
    // time.cancel();
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Center(
        child: Container(
          height: 70,
          width: 280,
          child: Image.asset(
            imagePath + "logo$imageNum.png",
          ),
        ),
      ),
    );
  }
}
