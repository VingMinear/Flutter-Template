import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Log.dart';

// ------------------------ extension from Varriable --------------------------------

extension ConvertMaskText on String {
  String convertToMaskedText() {
    if (length < 3) {
      return this;
    }
    var result = this;
    if (substring(0, 3) == '855') {
      result = substring(3, length);
    } else if (substring(0, 4) == '+855') {
      result = substring(4, length);
    }
    String lastThreeChars = result.substring(result.length - 3);
    String maskedText = 'X' * (result.length - 3);
    return "+855 ${convertToFormattedNumber(maskedText + lastThreeChars, false)}";
  }

  String formatPhoneNumber({required String phone}) {
    try {
      String newPhone = phone.substring(0, 3);
      String unexpectedPhone = phone.substring(0, 5);
      if (unexpectedPhone == "+8550") {
        return "855${phone.substring(5)}";
      }
      if (newPhone == "855") {
        return phone;
      } else if (newPhone[0] == "0") {
        return phone[0].replaceAll('0', '855') + phone.substring(1);
      } else if (!newPhone.startsWith('0')) {
        return '885$phone';
      } else if (newPhone == "+85") {
        return phone.substring(1);
      }
    } catch (e) {
      Log.error(e);
    }
    return phone;
  }

  String cutPrefixNumber({required String phone}) {
    String newPhone = phone.substring(0, 3);
    if (newPhone == "855") {
      return "0${phone.substring(3)}";
    } else if (newPhone == "+855") {
      return "0${phone.substring(4)}";
    }
    return "0$phone";
  }

  String truncateString(int maxLength) {
    if (length <= maxLength) {
      return this;
    } else {
      return '${substring(0, maxLength)}...';
    }
  }

  String formatPh() {
    if (length < 3) {
      return this;
    }
    var result = this;
    if (substring(0, 3) == '855') {
      result = substring(3, length);
    } else if (substring(0, 4) == '+855') {
      result = substring(4, length);
    }
    String prefix = result.substring(0, 2);
    String maskedText = 'X' * (result.length - 2);
    return "+855 $prefix ${convertToFormattedNumber(maskedText, true)}";
  }

  String convertToFormattedNumber(String inputText, bool showPrefix) {
    String formattedNumber =
        "${inputText.substring(0, 3)} ${showPrefix ? inputText.substring(3) : '${inputText.substring(3, 6)} ${inputText.substring(6)}'}";

    return formattedNumber;
  }
}

extension Format on double {
  String get currency {
    final result = NumberFormat("#,##0.00", "en_US");
    return result.format(this);
  }
}

extension ConvertSize on int {
  double get mb {
    var kb = this / 1024.0;
    return (kb / 1024.0);
  }
}

// ------------------------ extension from widget or anyclass --------------------------------

extension TextRequired on Text {
  Widget txtRequired({double space = 5}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data ?? '',
          style: style,
        ),
        SizedBox(width: space),
        Text(
          " *",
          style: style ??
              const TextStyle(
                fontSize: 15,
                color: Colors.red,
              ),
        ),
      ],
    );
  }
}

Route _animationNav(Widget page) {
  if (!kIsWeb) {
    return Platform.isAndroid
        ? PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          )
        : CupertinoPageRoute(builder: (context) => page);
  } else {
    return MaterialPageRoute(builder: (context) => page);
  }
}

extension Utility on BuildContext {
  void nextFocus() {
    var resul = FocusScope.of(this).nextFocus();
    if (resul) {
      Log.success('can next');
    } else {
      Log.success('cann"t next');
    }
  }

  Future push(Widget page) async {
    return await Navigator.push(this, _animationNav(page));
  }

  Future pushClear(Widget page) async {
    return Navigator.pushAndRemoveUntil(
      this,
      _animationNav(page),
      (route) => false,
    );
  }

  void pop() {
    if (Navigator.canPop(this)) {
      Navigator.pop(this);
    }
  }
}

extension ResponsiveText on Text {
  /// allow for row widget only
  Flexible responsive({required bool isRowWidget}) {
    if (isRowWidget) {
      return Flexible(
        child: this,
      );
    }
    throw FlutterError("Allow only row widget");
  }
}
