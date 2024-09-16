import 'package:flutter/material.dart';

class CustomDividedBar extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Axis direction;
  final double? size;
  final Color? color;
  const CustomDividedBar({
    super.key,
    this.margin,
    this.direction = Axis.horizontal,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: direction == Axis.vertical ? 24 / 16 : size,
      height: direction == Axis.horizontal ? 24 / 16 : size,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24 / 2),
      ),
    );
  }
}