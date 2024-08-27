import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rwad/const.dart';

import '../cubit/login_cubit.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          Get.snackbar(
            "Error",
            state.msg,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        if (state is LoginSuccessState) {
          Get.snackbar(
            "Success",
            state.msg,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 100.0,
            right: 20,
            left: 20,
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                          text: "Name",
                          controller: _nameController,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        CustomTextfield(
                          text: "Phone",
                          controller: _phoneController,
                          validator: (val) {
                            if (val!.length != 11) {
                              return "phone number should be more than 11 letters";
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
                            if (val!.length < 6) {
                              return "Password should be more than 6 letters";
                            }
                          },
                        ),
                        SizedBox(
                          height: height * .04,
                        ),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                        isRegister: true,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        name: _nameController.text,
                                        phone: _phoneController.text,
                                      );
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                                ),
                                child: const Center(
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
