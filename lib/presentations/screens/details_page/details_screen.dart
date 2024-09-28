import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/screens/details_page/widgets/expanded_panel.dart';
import 'package:hotel_management/presentations/screens/home/widgets/carosole_for_details.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CarosoleforDetails(
                        dotIndicator: false,
                      ),
                      Positioned(
                        top: 25.h,
                        left: 5.w,
                        child: OnProcessButtonWidget(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
                          borderRadius: BorderRadius.circular(30.r),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Positioned(
                        top: 25.h,
                        right: 5.w,
                        child: OnProcessButtonWidget(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                          borderRadius: BorderRadius.circular(30.r),
                          child: Icon(
                            Icons.favorite,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25.h,
                        right: 25.w,
                        child: OnProcessButtonWidget(
                          backgroundColor: Colors.black,
                          contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                          borderRadius: BorderRadius.circular(30.r),
                          child: Icon(
                            Icons.search_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  2.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        AutoSizeText('White House', style: TextStyle(fontSize: 20.sp, color: Theme.of(context).primaryColor)),
                        Spacer(),
                        AutoSizeText('5.0', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor)),
                        5.horizontalSpace,
                        Icon(Icons.star, color: Theme.of(context).primaryColor, size: 14.sp),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  const CustomDividedBar(color: AppColors.kPrimaryColor),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            'Booking Dates',
                            style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            Icon(Icons.calendar_month, color: Theme.of(context).primaryColor),
                            const Spacer(),
                            InkWell(
                                overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                child: AutoSizeText('Change', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).scaffoldBackgroundColor))),
                          ],
                        )
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  const CustomDividedBar(color: AppColors.kPrimaryColor),
                  ExpandedPanel(),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            'Cancellation Policy',
                            style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 35.w, right: 20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            'Free Cancellation',
                            style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                          ),
                        ),
                        5.verticalSpace,
                        AutoSizeText(
                          'We offer a complete refund for cancellations made 24 hours prior to the booking time',
                          style: TextStyle(fontSize: 13.sp, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                          wrapWords: true,
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  const CustomDividedBar(color: AppColors.kPrimaryColor),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            'Description',
                            style: TextStyle(fontSize: 16.sp, color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 35.w, right: 20.w),
                    child: AutoSizeText(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: TextStyle(fontSize: 13.sp, color: Theme.of(context).primaryColor.withOpacity(0.6)),
                      wrapWords: true,
                    ),
                  ),
                  5.verticalSpace,
                ],
              ),
            ),
          ),
        OnProcessButtonWidget(
          contentPadding: EdgeInsets.symmetric( vertical: 20.h),
          borderRadius: BorderRadius.zero,
          child: AutoSizeText('Continue', style: TextStyle(fontSize: 16.sp, color: Theme.of(context).scaffoldBackgroundColor)),
        )
        ],
      ),
    );
  }
}
