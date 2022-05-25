import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }

  static bool isMobile() => SizeConfig.screenWidth < 850;

  static bool isTablet() => SizeConfig.screenWidth < 1100 && SizeConfig.screenWidth >= 850;

  static bool isDesktop() => SizeConfig.screenWidth >= 1100;
}

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / (SizeConfig.isTablet() ? 800.0 : 812.0)) * screenHeight;
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / (SizeConfig.isTablet() ? 1000.0 : 375.0)) * screenWidth;
}
