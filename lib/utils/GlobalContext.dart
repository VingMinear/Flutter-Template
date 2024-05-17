import 'package:flutter/material.dart';

class GlobalContext {
  /// Note* this ctx use for route screen
  static BuildContext get context =>
      navigatorKey.currentState?.context ?? _context;
  static set context(BuildContext context) {
    _context = context;
  }

  static late BuildContext _context;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
