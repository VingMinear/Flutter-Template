import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer(
      {super.key,
      required this.child,
      this.baseColor,
      this.highlightColor,
      this.period});
  final Widget child;
  final Color? baseColor, highlightColor;
  final Duration? period;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade200,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      period: period ?? const Duration(milliseconds: 1500),
      child: child,
    );
  }
}
