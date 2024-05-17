import 'package:flutter/widgets.dart';

class ModalBottomSheetScroll extends StatelessWidget {
  const ModalBottomSheetScroll(
      {super.key, required this.percentPush, required this.child});
  final Widget child;
  final double percentPush;
  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        child,
        Container(
          height: keyboardHeight * percentPush,
        ),
      ],
    );
  }
}
