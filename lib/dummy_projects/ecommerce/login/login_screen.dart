import 'package:flutter/material.dart';
import 'package:rwad/const.dart';
import 'package:rwad/dummy_projects/ecommerce/login/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          right: 20,
          left: 20,
        ),
        child: Center(
          child: Form(
            key: _formKey,
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
                    CustomTextfield(
                      text: "Email",
                      controller: _emailController,
                      validator: (val) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!);
                        if (!emailValid) {
                          return "This field should be a valid email";
                        }
                      },
                    ),
                    SizedBox(
                      height: height * .02,
                    ),
                    CustomTextfield(
                      text: "Password",
                      isPassword: true,
                      controller: _passwordController,
                      validator: (val) {
                        if (val!.length < 9) {
                          return "Password should be more than 8 letters";
                        }
                      },
                    ),
                    SizedBox(
                      height: height * .04,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print("Email is  ${_emailController.text}");
                          print("Password is  ${_passwordController.text}");
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
