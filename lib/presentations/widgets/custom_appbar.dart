
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/assets/app_icons.dart';
import '../../core/constants/colors/app_colors.dart';
import '../../main.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title, required this.callback,
  }) : super(key: key);

  final String? title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        //for custom app bar
        height: 48,
        width: double.maxFinite,
        color: AppColors.kWhiteColor,
        child: Row(
          children: [
            16.w.horizontalSpace,
            SvgPicture.asset(AppIcons.backArrow),
            16.w.horizontalSpace,
            Text(title ?? "",
              style: appTheme().textTheme.bodyMedium!.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dark40
              ),
            )
          ],
        ),
      ),
    );
  }
}