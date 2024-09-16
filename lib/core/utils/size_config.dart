import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late TextScaler textScaler;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
    textScaler = _mediaQueryData.textScaler;
  }

  static bool isMobile() => SizeConfig.screenWidth < 768;

  static bool isTablet() => SizeConfig.screenWidth < 1366 && SizeConfig.screenWidth >= 768;

  static bool isDesktop() => SizeConfig.screenWidth >= 1366;
  
  static double scaleSize(double inputSize) {
    double screenWidth = SizeConfig.screenWidth;
    return (inputSize / 375.0) * screenWidth;
  }
}

//------------------------------------------------------------ Get the proportionateScreenHeight height as per screens size
double getScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;


  return (inputHeight / (SizeConfig.isTablet() ? 800.0 : 812.0)) * screenHeight;
}

//--------------------------------------------------------------Get the proportionateScreenWidth height as per screens size
double getScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputWidth / (SizeConfig.isTablet() ? 1000.0 : 375.0)) * screenWidth;
}

//----------------------------------------------------------- font size according to screen DPI
double getFontSize(double inputFontSize) {
  return SizeConfig.textScaler.scale(inputFontSize);
}

//--------------------------------------------------- Get the appropriate border radius as per screen size
double getBorderRadius(double inputRadius) {
  double screenWidth = SizeConfig.screenWidth;
  return (inputRadius / 375.0) * screenWidth;
}

//----------------------------------------------for vertical space
Widget getVerticalSpace(double inputSpace) {
   return SizedBox(
    height: getScreenHeight(inputSpace),
  );
}

//----------------------------------------------for Horizontal space
Widget getHorizontalSpace(double inputSpace) {
  return SizedBox(
    width: getScreenWidth(inputSpace),
  );
}