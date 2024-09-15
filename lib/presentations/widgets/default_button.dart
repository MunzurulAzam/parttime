import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_management/core/constants/colors/app_colors.dart';
import 'package:hotel_management/presentations/widgets/circular_progress.dart';

enum ButtonType { solid, border }

// ignore: non_constant_identifier_names
Widget DefaultButton(
    {Widget? icon,
    required VoidCallback onTap,
    required Widget child,
    Color? backgroundColor,
    ButtonType buttonType = ButtonType.solid,
    Color? borderColor,
    Color? disableColor,
    Color? loadingColor,
    double? borderRadius,
    bool enable = true,
    bool enableShadow = true,
    EdgeInsetsGeometry? padding,
    bool isLoading = false}) {
  return InkWell(
    onTap: enable
        ? !isLoading
            ? onTap
            : null
        : null,
    borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
    child: Container(
      padding: padding ??
          REdgeInsets.all(16.r)
              .copyWith(top: buttonType == ButtonType.border ? 16.r + 2 : 16.r, bottom: buttonType == ButtonType.border ? 16.r + 2 : 16.r),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: buttonType == ButtonType.solid
            ? enable
                ? backgroundColor ?? AppColors.kButtonColor
                : disableColor ?? AppColors.kButtonColor.withOpacity(0.5)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
        border: buttonType == ButtonType.border
            ? Border.all(color: enable ? borderColor ?? AppColors.kButtonColor : AppColors.kButtonColor.withOpacity(0.5), width: 1)
            : null,
        boxShadow: enable
            ? buttonType == ButtonType.solid
                ? [
                    // BoxShadow(
                    // color: (backgroundColor ?? AppColors.kButtonColor)
                    //     .withOpacity(0.25),
                    // blurRadius: 4.r,
                    // offset: const Offset(0.0, 5),
                    // ),
                  ]
                : null
            : null,
      ),
      child: isLoading
          ? CircularProgress(
              color: loadingColor == null
                  ? buttonType == ButtonType.border
                      ? AppColors.kButtonColor
                      : AppColors.kWhiteColor
                  : AppColors.kWhiteColor,
              size: 22.h + 1,
            )
          : icon != null
              ? Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Center(
                      child: child,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: icon,
                    )
                  ],
                )
              : child,
    ),
  );
}
