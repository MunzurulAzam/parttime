import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors/app_colors.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Poppins',
  appBarTheme: AppBarTheme(
    toolbarHeight: 65.h,
    titleTextStyle: const TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    backgroundColor: AppColors.kCardDarkColor,
    elevation: 0.0,
    iconTheme: const IconThemeData(
      color: AppColors.kWhiteColor,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.kBlackColor,
    ),
    centerTitle: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: AppColors.kCardDarkColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.kWhiteColor,
      systemNavigationBarDividerColor: AppColors.kWhiteColor,
    ),
  ),
  iconTheme: IconThemeData(
    color: AppColors.kWhiteColor,
    size: 24.r,
  ),
  primaryColor: AppColors.kPrimaryColor,
  secondaryHeaderColor: AppColors.kSecondaryColor,
  disabledColor: const Color(0xffa2a7ad),
  scaffoldBackgroundColor: AppColors.kBgDarkColor,
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: AppColors.kCardDarkColor,
  cardTheme: CardTheme(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    color: AppColors.kCardDarkColor,
    margin: EdgeInsets.zero,
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
    fillColor: AppColors.kBlackColor,
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
      color: AppColors.kWhiteColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.kPrimaryColor,
    ),
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
    ),
    displayMedium: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),

    bodyLarge: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
    ),
    titleLarge: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: AppColors.kWhiteColor,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
        color: AppColors.kWhiteColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1.0),
    labelMedium: TextStyle(
        color: AppColors.kWhiteColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 1.0),
    labelLarge: TextStyle(
        color: AppColors.kWhiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: 1.0),
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColors.kPrimaryColor,
    secondary: AppColors.kSecondaryColor,
  )
      .copyWith(background: AppColors.kBgDarkColor)
      .copyWith(error: AppColors.kErrorColor),
);
