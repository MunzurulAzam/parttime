import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/profile_photo.dart';
import 'package:hotel_management/presentations/widgets/custom_text_from_field.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(''),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              5.verticalSpace,
              Align(alignment: Alignment.centerLeft, child: AutoSizeText('Profile Setting', style: TextStyle(fontSize: 24.sp, color: AppColors.kPrimaryColor))),
              25.verticalSpace,
              Center(
                child: ProfilePhoto(
                  cornerRadius: 50.r,
                  totalWidth: 90.w,
                  color: AppColors.dark10,
                  image: const NetworkImage(
                    'https://i.pinimg.com/736x/c0/74/9b/c0749b7cc401421662ae901ec8f9f660.jpg',
                  ),
                ),
              ),
              10.verticalSpace,
              AutoSizeText(
                'Morshedul Islam',
                style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              2.verticalSpace,
              AutoSizeText(
                'morshedulislam@gmail.com',
                style: TextStyle(fontSize: 14.sp, color: AppColors.kPrimaryColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              20.verticalSpace,
              Align(alignment: Alignment.centerLeft, child: AutoSizeText('Name', style: TextStyle(fontSize: 16.sp, color: AppColors.kPrimaryColor))),
              5.verticalSpace,
               CustomTextFormField(
                fillColor: AppColors.dark10.withOpacity(0.3),
                prefixIcon: const Icon(
                  Icons.person,
                  color: AppColors.kPrimaryColor,
                ),
                hintText: 'Name',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
                enableBoderColor: AppColors.kPrimaryColor,
                focusBoderColor: AppColors.kPrimaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                borderRadius: BorderRadius.circular(10.r),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              10.verticalSpace,
          
              Align(alignment: Alignment.centerLeft, child: AutoSizeText('Email', style: TextStyle(fontSize: 16.sp, color: AppColors.kPrimaryColor))),
              5.verticalSpace,
               CustomTextFormField(
                fillColor: AppColors.dark10.withOpacity(0.3),
                prefixIcon: const Icon(
                  Icons.mail,
                  color: AppColors.kPrimaryColor,
                ),
                hintText: 'Email',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
                enableBoderColor: AppColors.kPrimaryColor,
                focusBoderColor: AppColors.kPrimaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                borderRadius: BorderRadius.circular(10.r),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              10.verticalSpace,
          
              Align(alignment: Alignment.centerLeft, child: AutoSizeText('Phone Number', style: TextStyle(fontSize: 16.sp, color: AppColors.kPrimaryColor))),
              5.verticalSpace,
               CustomTextFormField(
                fillColor: AppColors.dark10.withOpacity(0.3),
                prefixIcon: const Icon(
                  Icons.phone,
                  color: AppColors.kPrimaryColor,
                ),
                hintText: 'Phone Number',
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
                enableBoderColor: AppColors.kPrimaryColor,
                focusBoderColor: AppColors.kPrimaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                borderRadius: BorderRadius.circular(10.r),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              20.verticalSpace,
              OnProcessButtonWidget(
                contentPadding: EdgeInsets.symmetric( vertical: 10.0.h),
                child: AutoSizeText(
                  'Update',
                  style: TextStyle(fontSize: 16.sp, color: AppColors.kWhiteColor),
                ),
              )
            ],
          ),
        ));
  }
}
