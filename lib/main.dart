import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rwad/dummy_projects/note/cubit/note_cubit.dart';
import 'package:rwad/dummy_projects/note/note_hive_helper.dart';

import 'dummy_projects/note/note_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(NoteHiveHelper.noteBox);
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
      create: (context) => NoteCubit()..getNotes(),
      child: GetMaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        home: NoteScreen(),
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
