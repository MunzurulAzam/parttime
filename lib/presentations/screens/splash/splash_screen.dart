import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/assets/app_images.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/providers/splash_screen_provider/splash_screen_riverpod_provider.dart';

import '../../../core/config/routes/app_routes.dart';
import '../../../providers/auth_provider/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(splashNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: SizedBox(
        child: Center(
          child: Image.asset(AppImages.logo,),
        ),
      ),
    );
  }
}