<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
>>>>>>> 834c035 (booking list data add done)
=======
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
>>>>>>> 8e2bbe7 (booking design updated)
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/helper/date_formater.dart';
<<<<<<< HEAD
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
<<<<<<< HEAD
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
=======
import 'package:hotel_management/presentations/widgets/on_process_button.dart';
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
>>>>>>> 834c035 (booking list data add done)
=======
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> 8e2bbe7 (booking design updated)
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
=======
>>>>>>> cf3035c (booking design updated)
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/core/helper/date_formater.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/providers/booking_provider/booking_provider.dart';
<<<<<<< HEAD
>>>>>>> f036bf5 (booking list data add done)
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> cf3035c (booking design updated)

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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 834c035 (booking list data add done)
=======

>>>>>>> 8e2bbe7 (booking design updated)
=======
>>>>>>> f036bf5 (booking list data add done)
=======

>>>>>>> cf3035c (booking design updated)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Booking List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
<<<<<<< HEAD
<<<<<<< HEAD
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: FutureBuilder(
<<<<<<< HEAD
=======
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: FutureBuilder(
<<<<<<< HEAD
>>>>>>> f036bf5 (booking list data add done)
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
<<<<<<< HEAD
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
=======
=======
>>>>>>> cf3035c (booking design updated)
          future: bookingProvider0.fetchBookings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final bookings = bookingProvider0.bookings;

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  String formattedDateStart =
                  formatDate(booking['booking_start_date']);
                  String formattedDateEnd =
                  formatDate(booking['booking_end_date']);

                  return Card(
                    margin: EdgeInsets.only(bottom: 20.h),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Booking header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
<<<<<<< HEAD
=======
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
>>>>>>> d889506 (log in function)
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
=======
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                const NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                                radius: 20.r,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    booking['user_name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    booking['user_email'],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
>>>>>>> cf3035c (booking design updated)
                                    ),
                                  ),
                                ],
                              ),
<<<<<<< HEAD
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
<<<<<<< HEAD
=======
                              Chip(
                                label: Text(
                                  '${booking['day_count']} days',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                backgroundColor: AppColors.kPrimaryColor,
                              ),
                            ],
                          ),
                          Divider(height: 20.h, thickness: 1),
                          // Booking details
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Start Date:',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    formattedDateStart,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'End Date:',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    formattedDateEnd,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
>>>>>>> cf3035c (booking design updated)
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Amount:',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '\$${booking['total_amount']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Villa Name:',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${booking['villa_name']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Villa Location:',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${booking['villa_location']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: AppColors.kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          // CustomDividerBar(), // Custom divider (or you can add other elements as per your design)
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
<<<<<<< HEAD
>>>>>>> 8e2bbe7 (booking design updated)
=======
=======
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
>>>>>>> f036bf5 (booking list data add done)
                        ),
                      );
                    },
                  ),
<<<<<<< HEAD
>>>>>>> d889506 (log in function)
=======
                );
              }
            }),
>>>>>>> f036bf5 (booking list data add done)
=======
>>>>>>> cf3035c (booking design updated)
      ),
    );
  }
}
