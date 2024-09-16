import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/assets/app_images.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/providers/splash_screen_provider/splash_screen_riverpod_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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