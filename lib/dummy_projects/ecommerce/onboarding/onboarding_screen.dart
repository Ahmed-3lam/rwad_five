import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/hive_helper.dart';

import '../../../const.dart';
import '../auth/screen/auth_screen.dart';
import 'model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _index = 0;
  void _changeTheme() {
    if (_index < onBoardingList.length - 1) {
      _index++;
      print(_index.toString() + "===========");
    } else {
      Get.offAll(AuthScreen());
    }

    setState(() {});
  }

  @override
  void initState() {
    HiveHelper.setValueInOnboardingBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 100.0,
          start: 20,
          end: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 300,
                child: Image.asset(
                  imagePath + onBoardingList[_index].image!,
                ),
              ),

              Column(
                children: [
                  Text(
                    onBoardingList[_index].title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    onBoardingList[_index].description!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              // SizedBox(
              //   height: 40,
              // ),
              GestureDetector(
                onTap: () {
                  _changeTheme();
                },
                child: Container(
                    height: 80,
                    child:
                        Image.asset(imagePath + onBoardingList[_index].next!)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
