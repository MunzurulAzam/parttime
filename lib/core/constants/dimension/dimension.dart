
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimension{
  static FontWeight textRegular=FontWeight.w400;
  static FontWeight textMedium=FontWeight.w500;
  static FontWeight textSemiMedium=FontWeight.w600;
  static FontWeight textBold=FontWeight.w700;

  static double get paddingTop=>ScreenUtil().statusBarHeight;
  // static double get paddingBottom=>MediaQuery.of(appContext).padding.bottom;
  // static double get screenRatio=>appSize().width/AppConstant.defaultScreenSize.width;
  // static double get appbarHeight => DefaultAppbar(title: '').preferredSize.height;
  // static Widget get bottomSpace => (paddingBottom+16.h).verticalSpace;
}