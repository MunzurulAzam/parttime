import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/config/routes/app_routes.dart';
import 'package:hotel_management/core/constants/assets/app_images.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

import '../../../providers/auth_provider/auth_provider.dart';

class StarterScreen extends ConsumerStatefulWidget {
  const StarterScreen({super.key});

  @override
  ConsumerState<StarterScreen> createState() => _TripScreensState();
}

class _TripScreensState extends ConsumerState<StarterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.bg,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              100.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),

                child: Image.asset('assets/images/logo2.png'),

                // CachedNetworkImage(
                //   imageUrl: 'https://i0.wp.com/premiervillarental.com/wp-content/uploads/2023/01/premier_villa_rentals.png?w=960&ssl=1',
                //   errorWidget: (context, url, error) {
                //     return Container(
                //       color: AppColors.kGrayIconColor,
                //     );
                //   },
                // ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [

              //     Align(
              //       alignment: Alignment.center,
              //       child: AutoSizeText(
              //         'Premier Resort Rentals',
              //         style: TextStyle(
              //           fontSize: 24.sp,
              //           color: AppColors.kPrimaryColor,
              //           fontWeight: FontWeight.bold,
              //         ),
              //         overflow: TextOverflow.ellipsis,
              //         maxLines: 1,
              //         textAlign: TextAlign.center,
              //       ),
              //     ),
              //   ],
              // ),

              Spacer(),
              OnProcessButtonWidget(
                onDone: (_) {
                  Navigator.pushNamed(context, RouteName.signUp);
                },
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
                onDone: (_) {
                  Navigator.pushNamed(context, RouteName.login);
                },
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

              100.verticalSpace,

            ],
          ),
        ],
      ),
    );
  }
}
