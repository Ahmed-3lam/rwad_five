import 'package:flutter/material.dart';
import 'package:rwad/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          right: 20,
          left: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 300,
                child: Image.asset(
                  imagePath + "logo2.png",
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 14, color: Color(0xFF8B8B97)),
                  ),
                  TextFormField(),
                  SizedBox(
                    height: height * .1,
                  ),
                  TextFormField(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
