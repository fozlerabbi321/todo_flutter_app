import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants/strings.dart';
import 'constants/theme/light_theme.dart';
import 'view/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: light,
      home: const SplashScreen(),
      transitionDuration: 300.milliseconds,
      defaultTransition: Transition.rightToLeft,
    );
  }
}

