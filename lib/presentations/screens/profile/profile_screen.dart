import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/config/routes/app_routes.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/custom_divider_bar.dart';
import 'package:hotel_management/presentations/profile_photo.dart';
import 'package:hotel_management/providers/product_details_provider/product_details_provider.dart';
import 'package:hotel_management/providers/profile_provider/profile_provider.dart';

import '../../../providers/auth_provider/auth_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
     final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      ref.read(profileUpdateProvider).fetchUserData(user.uid); // Fetch user data from Firestore
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: AutoSizeText(
          'Profile',
          style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfilePhoto(
                  cornerRadius: 50.r,
                  totalWidth: 90.w,
                  color: AppColors.dark10,
                  image: NetworkImage(
                    user?.photoURL ?? 'https://i.pinimg.com/736x/c0/74/9b/c0749b7cc401421662ae901ec8f9f660.jpg',
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      user?.displayName ?? '',
                      style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    1.verticalSpace,
                    AutoSizeText(
                      user?.email ?? '',
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
            child: ProfileContents(
              onTap: () {
                Navigator.pushNamed(context, RouteName.editProfile);
              },
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
          InkWell(
            onTap: () {
              ref.read(authProvider).signOut();
              Navigator.pushNamedAndRemoveUntil(context, RouteName.staterPage, (route) => false);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: const ProfileContents(
                title: 'Log out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContents extends StatelessWidget {
  const ProfileContents({super.key, this.title, this.onTap});

  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
