import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/GlobalContext.dart';

enum Lang {
  en,
  km,
}

class Language {
  static const sppLanguage = [
    Locale('en', 'US'),
    Locale('km', 'KH'),
  ];
  static void switchLanguage(Lang lang) {
    log("Switch Language ${lang.name}");
    if (lang == Lang.en) {
      EasyLocalization.of(GlobalContext.context)?.setLocale(
        sppLanguage.first,
      );
    } else {
      EasyLocalization.of(GlobalContext.context)?.setLocale(
        sppLanguage.last,
      );
    }
  }

  static Locale get currentLanguage {
    return EasyLocalization.of(GlobalContext.context)?.currentLocale ??
        sppLanguage.first;
  }
}
