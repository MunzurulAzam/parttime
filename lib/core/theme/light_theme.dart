import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors/app_colors.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    toolbarHeight: 65.h,
    titleTextStyle: const TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    color: AppColors.kWhiteColor,
    elevation: 0.0,
    iconTheme: const IconThemeData(
      color: AppColors.kBlackColor,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.kBlackColor,
    ),
    centerTitle: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.kWhiteColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.kBlackColor,
      systemNavigationBarDividerColor: AppColors.kBlackColor,
    ),
  ),
  iconTheme: IconThemeData(
    color: AppColors.kBlackColor,
    size: 24.r,
  ),
  fontFamily: 'Poppins',
  primaryColor: AppColors.kPrimaryColor,
  secondaryHeaderColor: AppColors.kSecondaryColor,
  disabledColor: const Color(0xFFBABFC4),
  scaffoldBackgroundColor: AppColors.kBgColor,
  brightness: Brightness.light,
  hintColor: const Color(0xFF808080),
  cardColor: AppColors.kWhiteColor,
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    margin: EdgeInsets.zero,
    color: AppColors.kWhiteColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.kPrimaryColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.dark40),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.dark40),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.dark40),
      borderRadius: BorderRadius.circular(8.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.kErrorColor),
      borderRadius: BorderRadius.circular(8.0),
    ),
    fillColor: AppColors.kWhiteColor,
    filled: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
    suffixIconColor: AppColors.dark20,
    prefixIconColor: AppColors.dark20,
    hintStyle: TextStyle(
      color: AppColors.dark10,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    labelStyle: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: AppColors.kBlackColor,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
        color: AppColors.kBlackColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.0),
    labelMedium: TextStyle(
        color: AppColors.kWhiteColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.0),
    labelLarge: TextStyle(
        color: AppColors.kBlackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.0),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.kPrimaryColor,
    secondary: AppColors.kSecondaryColor,
  )
      .copyWith(background: AppColors.kBgColor)
      .copyWith(error: AppColors.kErrorColor),
);
