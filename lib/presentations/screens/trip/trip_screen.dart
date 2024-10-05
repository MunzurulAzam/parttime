<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
>>>>>>> 834c035 (booking list data add done)
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/helper/date_formater.dart';
<<<<<<< HEAD
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
=======
import 'package:hotel_management/presentations/widgets/on_process_button.dart';
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
>>>>>>> 834c035 (booking list data add done)

class TripScreens extends ConsumerStatefulWidget {
  const TripScreens({super.key});

  @override
  ConsumerState<TripScreens> createState() => _TripScreensState();
}

class _TripScreensState extends ConsumerState<TripScreens> {
  @override
  Widget build(BuildContext context) {
    final bookingProvider0 = ref.watch(bookingProvider.notifier);
<<<<<<< HEAD

=======
>>>>>>> 834c035 (booking list data add done)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const AutoSizeText(
          'Booking List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: FutureBuilder(
            future: bookingProvider0.fetchBookings(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final bookings = bookingProvider0.bookings;
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {       
                      final booking = bookings[index];
                      String formattedDateStart = formatDate(booking['booking_start_date']);
                      String formattedDateEnd = formatDate(booking['booking_end_date']);
                      return OnProcessButtonWidget(
                        borderRadius: BorderRadius.circular(15.r),
                        backgroundColor: AppColors.kWhiteColor,
                        margin: EdgeInsets.only(bottom: 10.h),
                        enable: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            5.verticalSpace,
                            Row(
                              children: [
                                AutoSizeText('Name : ', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17.sp),maxLines: 1, overflow: TextOverflow.clip,),
                                AutoSizeText(' ${booking['user_name']}', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16.sp),maxLines: 1, overflow: TextOverflow.clip,),
                              ],
                            ),
                            5.verticalSpace,
                             Row(
                              children: [
                                AutoSizeText('Email : ', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17.sp), maxLines: 1, overflow: TextOverflow.clip,),
                                AutoSizeText(' ${booking['user_email']}', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16.sp),maxLines: 1, overflow: TextOverflow.clip,),
                              ],
                            ),
                            5.verticalSpace,
                             Row(
                              children: [
                                AutoSizeText('Total Amount : ', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17.sp), maxLines: 1, overflow: TextOverflow.clip,),
                                AutoSizeText(' ${booking['total_amount']}', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16.sp), maxLines: 1, overflow: TextOverflow.clip,),
                              ],
                            ),
                            5.verticalSpace,
                             Row(
                              children: [
                                AutoSizeText('Start Date : ', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17.sp),maxLines: 1, overflow: TextOverflow.clip,),
                                AutoSizeText(' $formattedDateStart', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16.sp),maxLines: 1, overflow: TextOverflow.clip,),
                              ],
                            ),
                            5.verticalSpace,
                             Row(
                              children: [
                                AutoSizeText('End Date : ', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17.sp),maxLines: 1, overflow: TextOverflow.clip,),
                                AutoSizeText(' $formattedDateEnd', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16.sp),maxLines: 1, overflow: TextOverflow.clip,),
                              ],
                            ),
                             5.verticalSpace,
                             Row(
                              children: [
                                AutoSizeText('Day Count : ', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 17.sp),maxLines: 1, overflow: TextOverflow.clip,),
                                AutoSizeText(' ${booking['day_count']}', style: TextStyle(color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 16.sp),maxLines: 1, overflow: TextOverflow.clip,),
                              ],
                            ),
                            5.verticalSpace,
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            }),
      ),
    );
  }
}
