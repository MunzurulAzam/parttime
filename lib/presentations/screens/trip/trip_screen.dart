import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/assets/app_images.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

class TripScreens extends StatefulWidget {
  const TripScreens({super.key});

  @override
  State<TripScreens> createState() => _TripScreensState();
}

class _TripScreensState extends State<TripScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.bcImage,
              fit: BoxFit.cover, 
            ),
          ),
          Column(
            children: [
           
              300.verticalSpace, 
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      'Premier Resort Rentals',
                      style: TextStyle(fontSize: 24.sp, color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,

                    ),
                  ),
                ],
              ),
              200.verticalSpace,
              OnProcessButtonWidget(
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                child: AutoSizeText(
                  'Sign Up',
                  style: TextStyle(fontSize: 18.sp, color: AppColors.kWhiteColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              15.verticalSpace,
              OnProcessButtonWidget(
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                child: AutoSizeText(
                  'Log In',
                  style: TextStyle(fontSize: 18.sp, color: AppColors.kWhiteColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
