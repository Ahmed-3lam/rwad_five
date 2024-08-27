import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/dio_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/hive_helper.dart';

import 'dummy_projects/ecommerce/auth/cubit/login_cubit.dart';
import 'dummy_projects/ecommerce/splash/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.onboardingBox);
  await Hive.openBox(HiveHelper.token);
  DioHelper.inint();
  runApp(const MyApp());
}

/// Stateless widget ( MyApp )
/// MaterialApp()
/// home: Scaffold
/// Text()  --- Center()
/// style: TextStyle(
/// Padding
/// Container
/// SizedBox
/// Column
/// Row
/// Icon

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: GetMaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    fillColor: Colors.grey[200],
    filled: true,
  ));
}
