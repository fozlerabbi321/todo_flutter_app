import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors_data.dart';
import '../../constants/images.dart';
import '../../constants/size_config.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animation.addListener(() => setState(() {}));
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {
      navigation();
    });
    super.initState();
  }

  void navigation() async {
    Get.offAll(() => const HomeScreen());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation as Animation<double>,
          child: Image.asset(
            Images.logo,
            width: _animation.value * getProportionateScreenWidth(200),
            height: _animation.value * getProportionateScreenWidth(200),
          ),
        ),
      ),
    );
  }
}
