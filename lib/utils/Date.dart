import 'package:easy_localization/easy_localization.dart';

import '../configs/Language.dart';

class Date {
  static DateTime get now => DateTime.now();
  static String format(DateTime date) => fmDMY.format(date);
  static DateFormat get fmDMY => DateFormat('dd-MM-yyyy', localeDate());
  static DateTime parse(String date) => fmDMY.parse(date);
  static String localeDate() {
    return Language.currentLanguage.languageCode;
  }
}
