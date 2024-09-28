import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/presentations/profile_photo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: AutoSizeText(
            'Profile',
            style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
          ),
          // actions: [
            // IconButton(
            //   icon: const Icon(
            //     Icons.settings,
            //     color: AppColors.kPrimaryColor,
            //   ),
            //   onPressed: () {},
            // ),
          // ]

      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfilePhoto(
                  cornerRadius: 50.r,
                  totalWidth: 90.w,
                  color: AppColors.dark10,
                  image: const NetworkImage(
                    'https://i.pinimg.com/736x/c0/74/9b/c0749b7cc401421662ae901ec8f9f660.jpg',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Morshedul Islam',
                      style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    1.verticalSpace,
                    AutoSizeText(
                      'morshedul.qtec@gmail.com',
                      style: TextStyle(fontSize: 17.sp, color: AppColors.kPrimaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.verticalSpace,
          CustomDividedBar(
            color: AppColors.kPrimaryColor.withOpacity(0.3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: const ProfileContents(
              title: 'Profile Settings',
            ),
          ),
          CustomDividedBar(
            color: AppColors.kPrimaryColor.withOpacity(0.3),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: const ProfileContents(
              title: 'Contact Support',
            ),
          ),
          // CustomDividedBar(
          //   color: AppColors.kPrimaryColor.withOpacity(0.3),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 18.w),
          //   child: const ProfileContents(
          //     title: 'Saved Payment Methods',
          //   ),
          // ),
          CustomDividedBar(
            color: AppColors.kPrimaryColor.withOpacity(0.3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: const ProfileContents(
              title: 'Privacy policy',
            ),
          ),
          CustomDividedBar(
            color: AppColors.kPrimaryColor.withOpacity(0.3),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: const ProfileContents(
              title: 'Log out',
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContents extends StatelessWidget {
  const ProfileContents({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            title ?? '',
            style: TextStyle(fontSize: 13.sp, color: AppColors.kPrimaryColor),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.kWhiteColor,
            size: 15.r,
          ),
        ],
      ),
    );
  }
}
