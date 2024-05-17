import 'package:flutter/material.dart';

import 'Colors.dart';

class AppText {
  static TextStyle errorStyle(
      {Color? color,
      FontWeight weight = FontWeight.w400,
      double fontSize = 13}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      color: color ?? Colors.red,
    );
  }

  static TextStyle hintStyle(
      {Color? color,
      FontWeight weight = FontWeight.w400,
      double fontSize = 15}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      color: color ?? Colors.grey,
    );
  }

  static TextStyle normalStyle(
      {Color? color,
      FontWeight weight = FontWeight.w400,
      double fontSize = 15}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: weight,
      color: color ?? Colors.black,
    );
  }
}

class AppStyle {
  static LinearGradient bgGradient = const LinearGradient(
    colors: [
      Color(0xff75B845),
      Color(0xff64893C),
    ],
  );
  static var boxShadow = [
    BoxShadow(
      blurRadius: 10,
      color: AppColor.shadowColor,
      spreadRadius: -1,
    ),
  ];
  static var cardShadow = [
    BoxShadow(
      color: AppColor.shadowColor,
      offset: const Offset(2, 2),
      blurRadius: 0.5,
    )
  ];
  BoxDecoration cardBoxDecoration({
    double? raduis,
    Color? color,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(raduis ?? 8),
      color: color ?? Colors.grey.shade300,
      boxShadow: boxShadow ?? const [],
    );
  }

  BoxDecoration cardDecoration(
      {double? raduis,
      Color? color,
      List<BoxShadow>? boxShadow,
      Gradient? gradient}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(raduis ?? 12),
      boxShadow: boxShadow ?? boxShadow,
      color: color ?? AppColor.whiteColor,
      gradient: gradient,
    );
  }
}
