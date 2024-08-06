import 'package:flutter/material.dart';

import 'dummy_projects/bmi_calc/bmi_calc_screen.dart';

void main() {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalcScreen(),
    );
  }
}
