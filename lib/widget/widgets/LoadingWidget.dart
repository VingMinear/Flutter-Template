import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.strokeWidth = 3.5,
  });
  final double strokeWidth;
  @override
  Widget build(BuildContext context) {
    return CircularCappedProgressIndicator(
      strokeWidth: strokeWidth,
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
    );
  }
}
