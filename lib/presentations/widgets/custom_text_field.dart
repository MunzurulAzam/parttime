import 'package:flutter/material.dart';
import '../../core/constants/colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        required this.hint,
        this.controller,
        this.onChanged,
        this.maxLines,
        this.textInputType,
        this.obscureText,
        this.onFieldSubmitted,
        this.validator,
        this.suffixIcon,
        this.color,
        this.onFinished,
        this.horizontalPadding,
        this.verticalPadding,
        this.fillColor,
        this.textStyle,
        this.prefixIcon,
        this.onTapCalender,
        this.enabled})
      : super(key: key);

  final String? hint;

  // final String? label;
  final int? maxLines;
  final ValueChanged? onChanged;
  final ValueChanged? onFinished;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final String? Function(String)? onFieldSubmitted;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? color;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool? enabled;
  final VoidCallback? onTapCalender;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCalender,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: TextFormField(
          enabled: enabled ?? true,
          maxLines: maxLines,
          obscureText: obscureText ?? false,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: TextInputAction.next,
          keyboardType: textInputType ?? TextInputType.emailAddress,
          decoration: formInputDecoration(
              suffixIcon: suffixIcon,
              color: color,
              horizontal: horizontalPadding,
              vertical: verticalPadding,
              hintText: hint!,
              prefixIcon: prefixIcon,
              fillColor: fillColor),
          onChanged: onChanged,
          style: textStyle ?? const TextStyle(fontSize: 14),
          validator: validator,
          onSaved: onFinished,
        ),
      ),
    );
  }
}

formInputDecoration(
    {required String hintText,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Color? color,
      Color? fillColor,
      double? horizontal,
      double? vertical}) {
  return InputDecoration(
    labelStyle: const TextStyle(
      fontSize: 16,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
    fillColor: fillColor ?? AppColors.dark20,
    filled: false,
    contentPadding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 10, vertical: vertical ?? 10),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.black12, width: 3),
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
      BorderSide(color: color ?? AppColors.kPrimaryColor, width: 1),
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.grey, width: 2),
      borderRadius: const BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      color: AppColors.dark20,
      fontSize: 16,
    ),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
  );
}