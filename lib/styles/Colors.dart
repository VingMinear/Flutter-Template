import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AppColor {
  static Color primaryColor = HexColor('222566');
  static Color whiteColor = Colors.white;
  static Color bgScaffold = const Color(0xffF5F5F5);
  static Color bgLoading = Colors.black.withOpacity(0.2);
  static Color darkBtn = const Color(0xff666666);
  static Color greyBtn = const Color(0xffB0B0B0);
  static Color disableColor = const Color(0xffE4E3E6);
  static Color warningColor = const Color(0xffff9f07);
  static Color cardDarkColor = const Color(0xff666666);
  static Color txtDarkColor = const Color(0xff666666);
  static Color mainColor = const Color(0xff0E75BB);
  static Color successColor = const Color(0xff38C976);
  static Color errorColor = const Color(0xffFE5050);
  static Color shadowColor = const Color(0xff000000).withOpacity(0.08);
  static Color logoColor = const Color(0xff6B8E45);
  static Color txtFieldColor = Colors.grey[200]!;
}
