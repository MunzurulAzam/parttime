import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_management/core/config/routes/app_routes.dart';
import 'package:hotel_management/core/constants/assets/app_icons.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/presentations/widgets/custom_text_field.dart';
import 'package:hotel_management/presentations/widgets/custom_text_from_field.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

import '../../../providers/auth_provider/auth_provider.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key});

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:   30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            120.verticalSpace,
            AutoSizeText(
              'Sign In',
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            2.verticalSpace,
            CustomDividedBar(
              color: AppColors.kPrimaryColor.withOpacity(0.7),
              size: 88.w,
            ),
            40.verticalSpace,
            AutoSizeText(
              'Please sign in to continue',
              style: TextStyle(fontSize: 16.sp, color: AppColors.kPrimaryColor),
            ),
            8.verticalSpace,
            CustomTextFormField(
              prefixIcon: const Icon(
                Icons.mail_outline_rounded,
                color: AppColors.kPrimaryColor,
              ),
              hintText: 'Email',
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
              enableBoderColor: AppColors.kPrimaryColor,
              focusBoderColor: AppColors.kPrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              borderRadius: BorderRadius.circular(10.r),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            13.verticalSpace,
            CustomTextFormField(
              obscureText: true,
              suffixIcon: const Icon(
                Icons.visibility_off,
                color: AppColors.kPrimaryColor,
              ),
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.kPrimaryColor,
              ),
              hintText: 'Password',
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
              enableBoderColor: AppColors.kPrimaryColor,
              focusBoderColor: AppColors.kPrimaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              borderRadius: BorderRadius.circular(10.r),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AutoSizeText(
                  'Forgot Password?',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.kPrimaryColor),
                ),
              ],
            ),
            30.verticalSpace,
            OnProcessButtonWidget(
              onDone: (_) {
                Navigator.pushNamed(context, RouteName.navigationScreen);
              },
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              // margin: EdgeInsets.symmetric(horizontal: 18.w),
              child: AutoSizeText(
                'Sign In',
                style: TextStyle(fontSize: 18.sp, color: AppColors.kWhiteColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            25.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: ()async{
                      User? user = await provider.signInWithGoogle();
                      if (user != null) {
                        if(context.mounted){
                          Navigator.pushReplacementNamed(context, RouteName.navigationScreen);
                        }
                      }else{
                        log('error');
                      }
                    },
                    child: SvgPicture.asset(AppIcons.googleIcon)),
                25.horizontalSpace,
                SvgPicture.asset(AppIcons.facebookIcon, height: 25.h, width: 25.w,)
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.kPrimaryColor),
                ),
                5.horizontalSpace,
                InkWell(
                  overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                  onTap: () {
                    // Navigator.pushNamed(context, RouteName.login);
                    Navigator.pushReplacementNamed(context, RouteName.signUp);
                  },
                  child: AutoSizeText(
                    'Sign Up',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.kWhiteColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
