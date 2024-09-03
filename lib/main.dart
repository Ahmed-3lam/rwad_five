import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/dio_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'package:rwad/dummy_projects/ecommerce/home/cubit/home_cubit.dart';
import 'package:rwad/dummy_projects/ecommerce/language_cubit/language_cubit.dart';
import 'package:rwad/dummy_projects/native/native_bridge.dart';

import 'dummy_projects/ecommerce/auth/cubit/login_cubit.dart';
import 'dummy_projects/ecommerce/splash/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.onboardingBox);
  await Hive.openBox(HiveHelper.token);
  await Hive.openBox(HiveHelper.KEY_BOX_APP_LANGUAGE);
  DioHelper.inint();
  print(await NativeBridge.getNativeData());
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            ..getBanners()
            ..getProduct(),
        ),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return GetMaterialApp(
            locale: state.locale,
            theme: themeData(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
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
