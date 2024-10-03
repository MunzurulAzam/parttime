import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/helper/date_formater.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripScreens extends ConsumerStatefulWidget {
  const TripScreens({super.key});

  @override
  ConsumerState<TripScreens> createState() => _TripScreensState();
}

class _TripScreensState extends ConsumerState<TripScreens> {
  @override
  Widget build(BuildContext context) {
    final bookingProvider0 = ref.watch(bookingProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black ,
        title: const AutoSizeText('Booking List', style: TextStyle(color: Colors.white),),),
      backgroundColor: Colors.black,
      body:                 Padding(
        padding:  EdgeInsets.only(top: 10.h),
        child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Container(
                          height: 250.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 210.h,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        width: double.infinity,
                                         '',
                                        fit: BoxFit.fill,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 7.h,
                                left: 0, // Position it to the left
                                right: 0, // Position it to the right
                                child: Container(
                                  height: 55.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.kWhiteColor,
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Column(
                                        //   mainAxisAlignment: MainAxisAlignment.center,
                                        //   children: [
                                        //     AutoSizeText(
                                        //        'aaa',
                                        //       style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),
                                        //     ),
                                        //     AutoSizeText(
                                        //       '\$/ day',
                                        //       style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),
                                        //     ),
                                        //   ],
                                        // ),
                                       
                                        OnProcessButtonWidget(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
                                          height: 20.h,
                                          backgroundColor: AppColors.kPrimaryColor,
                                          child: AutoSizeText(
                                            'Booked',
                                            style: TextStyle(fontSize: 13.sp, color: AppColors.kWhiteColor),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Positioned(
                              //     top: 15.h,
                              //     right: 15.w,
                              //     child: Container(
                              //       padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                              //       decoration: BoxDecoration(
                              //         color: AppColors.kWhiteColor,
                              //         borderRadius: BorderRadius.circular(20.r),
                              //       ),
                              //       child: Icon(
                              //         Icons.favorite,
                              //         color: AppColors.kPrimaryColor,
                              //         size: 20.r,
                              //       ),
                              //     ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
              
    );
  }
}
