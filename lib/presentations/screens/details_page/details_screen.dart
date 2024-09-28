import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/presentations/screens/home/widgets/carosole_for_details.dart';
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
          Stack(
            children: [
              CarosoleforDetails(
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
                  child: Icon(Icons.favorite, color:  Theme.of(context).primaryColor,),
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
            padding:  EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    AutoSizeText('White House', style: TextStyle(fontSize: 20.sp, color: Theme.of(context).primaryColor)),
                    Spacer(),
                  AutoSizeText('5.0', style: TextStyle(fontSize: 14.sp, color: Theme.of(context).primaryColor)),
                  5.horizontalSpace,
                  Icon(Icons.star, color: Theme.of(context).primaryColor, size: 14.sp),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
