import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/profile_photo.dart';

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
        body: Column(
          children: [
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
          ],
        ));
  }
}
