import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/screens/home/widgets/carosole_slider.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView( // Added SingleChildScrollView to avoid overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Ensure text aligns properly
          children: [
            30.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: CarouselSliderWidget(),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Top Destination',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  )),
            ),
            15.verticalSpace,
            SizedBox( 
              height: 90.h, 
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.r)),
                          height: 150.h,
                          width: 150.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.r),
                              child: Image.network(
                                  'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=')),
                        ),
                        Positioned(
                          bottom: 30.h,
                          left: 30.w,
                          child: AutoSizeText(
                            'House 64i8',
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: AppColors.kWhiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            18.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    'Recently Viewed',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  )),
            ),
            10.verticalSpace,
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: SizedBox(
                height: 195.h, // Ensure the container has a defined height
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h, right: 10.w),
                      child: Container(
                        height: 250.h,
                        width: 270.w, // Give a defined width to avoid layout issues
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 170.h,
                                  width: double.infinity, // Full width
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Image.network(
                                      'https://media.istockphoto.com/id/104731717/photo/luxury-resort.jpg?s=612x612&w=0&k=20&c=cODMSPbYyrn1FHake1xYz9M8r15iOfGz9Aosy9Db7mI=',
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                              bottom: 5.h,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 55.h,
                                decoration: BoxDecoration(
                                  color: AppColors.kWhiteColor,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            'House i68',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.kPrimaryColor,
                                            ),
                                          ),
                                          AutoSizeText(
                                            '\$399 / day',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              color: AppColors.kPrimaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      OnProcessButtonWidget(
                                        height: 20.h,
                                        backgroundColor:
                                            AppColors.kPrimaryColor,
                                        child: AutoSizeText(
                                          'Book Now',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.kWhiteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 15.h,
                              right: 15.w,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                  color: AppColors.kWhiteColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.kPrimaryColor,
                                  size: 20.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
