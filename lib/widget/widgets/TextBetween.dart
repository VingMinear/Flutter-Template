import 'package:flutter/material.dart';

import 'ModifyRow.dart';

Widget textBetween({
  required String leftTxt,
  required String rightTxt,
  TextStyle? leftStyle,
  TextStyle? rightStyle,
  int flex = 1,
  double spacing = 4,
}) {
  return ModifyRow(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    left: Flexible(
      flex: flex,
      child: Text(
        leftTxt,
        style: leftStyle,
      ),
    ),
    spacing: spacing,
    right: Flexible(
      child: Text(
        rightTxt,
        style: rightStyle,
        maxLines: 2,
      ),
    ),
  );
}

Widget textBetweenCopyWith({
  required String leftTxt,
  required String rightTxt,
  TextStyle? leftStyle,
  TextStyle? rightStyle,
  int flexRight = 1,
  int flexLeft = 1,
  MainAxisAlignment? mainAxisAlignment,
  double spacing = 4,
}) {
  return ModifyRow(
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: CrossAxisAlignment.start,
    left: Expanded(
      flex: flexLeft,
      child: Text(
        leftTxt,
        style: leftStyle,
      ),
    ),
    spacing: spacing,
    right: Expanded(
      flex: flexRight,
      child: Text(
        rightTxt,
        style: rightStyle,
        maxLines: 2,
      ),
    ),
  );
}
