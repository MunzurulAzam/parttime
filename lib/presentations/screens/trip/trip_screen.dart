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
        backgroundColor: AppColors.kPrimaryColor,
        title: const Text(
          'Booking List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: FutureBuilder(
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
                                    booking['user_name'] ?? 'Guest',
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
                                    ),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
