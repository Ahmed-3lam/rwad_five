import 'package:flutter/material.dart';
import 'package:rwad/widgets/appbar.dart';

void main() {
  runApp(const MyApp());
}

/// Stateless widget ( MyApp )
/// MaterialApp()
/// home: Scaffold
/// Text()  --- Center()
/// style: TextStyle(
///

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            // padding: EdgeInsets.all(50),
            color: Colors.green,
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
