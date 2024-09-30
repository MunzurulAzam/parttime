import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/profile_photo.dart';
import 'package:hotel_management/presentations/widgets/custom_text_from_field.dart';
import 'package:hotel_management/presentations/widgets/on_process_button.dart';
import 'package:hotel_management/providers/auth_provider/auth_provider.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}
final _formKey = GlobalKey<FormState>();

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
_loadUserData();
    super.initState();
  }

  void _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      _nameController.text = user.displayName ?? '';
      _emailController.text = user.email ?? '';
      _phoneController.text = userDoc['phone'] ?? '';
    }
  }

  Future<void> _updateProfile() async {
    // if (_formKey.currentState!.validate()) {  //!_____________________________need if has validation

      final auth = ref.watch(authProvider);


      await auth.updateUserProfile(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    // }
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(''),
        ),
        body: Form(
          child: Padding(
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
                    image:  NetworkImage(
                      user?.photoURL ??'',
                    ),
                  ),
                ),
                10.verticalSpace,
                AutoSizeText(
                  user?.displayName ??'',
                  style: TextStyle(fontSize: 20.sp, color: AppColors.kPrimaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                AutoSizeText(
                 user?.email ?? '',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.kPrimaryColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                20.verticalSpace,
                Align(alignment: Alignment.centerLeft, child: AutoSizeText('Name', style: TextStyle(fontSize: 16.sp, color: AppColors.kPrimaryColor))),
                5.verticalSpace,
                 CustomTextFormField(
                  textEditingController: _nameController,
                  fillColor: AppColors.dark10.withOpacity(0.3),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.kPrimaryColor,
                  ),
                  hintText: user?.displayName ?? 'Name',
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
                  textEditingController: _emailController,
                  fillColor: AppColors.dark10.withOpacity(0.3),
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: AppColors.kPrimaryColor,
                  ),
                  hintText: user?.email ?? 'Email',
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
                  textEditingController: _phoneController,
                  fillColor: AppColors.dark10.withOpacity(0.3),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.kPrimaryColor,
                  ),
                  hintText: user?.phoneNumber ?? 'Phone Number',
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
                  onTap: () async{
                   await _updateProfile();
                    return null;
                  },
                  contentPadding: EdgeInsets.symmetric( vertical: 10.0.h),
                  child: AutoSizeText(
                    'Update',
                    style: TextStyle(fontSize: 16.sp, color: AppColors.kWhiteColor),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
