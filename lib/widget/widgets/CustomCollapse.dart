import 'package:flutter/material.dart';

class CustomCollapse extends StatelessWidget {
  const CustomCollapse({
    super.key,
    required this.clickViewDetail,
    required this.child,
  });
  final bool clickViewDetail;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(height: 0.0),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState: clickViewDetail
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.05, 1.0, curve: Curves.fastOutSlowIn),
      duration: const Duration(milliseconds: 300),
      secondChild: child,
    );
  }
}
