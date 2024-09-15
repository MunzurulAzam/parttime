import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

Future customBottomSheet({
  BuildContext? context,
  required Widget child,
  ShapeBorder? shape,
  Color? backgroundColor,
  bool isDismissible = true,
}) {
  return showModalBottomSheet<void>(
    shape: shape ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
            topRight: Radius.circular(6.r),
          ),
        ),
    backgroundColor: backgroundColor,
    clipBehavior: Clip.antiAlias,
    context: context ?? appContext,
    isDismissible: isDismissible,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return child;
    },
  );
}
