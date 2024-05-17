import 'package:flutter/cupertino.dart';
import 'package:phum_assocation/utils/GlobalContext.dart';

class Device {
  static final _screen =
      MediaQueryData.fromView(View.of(GlobalContext.context));
  static bool get isXtraSmallScreen {
    return _screen.size.width < 330;
  }

  static bool get isSmallScreen {
    return _screen.size.width < 380;
  }

  static bool get isNormalScreen {
    return _screen.size.height < 800 ||
        _screen.size.width >= 380 && _screen.size.width < 550;
  }

  static bool get isMediumScreen {
    return _screen.size.width >= 550 && _screen.size.width < 800;
  }

  static bool get isLargeScreen {
    return _screen.size.width >= 1000;
  }

  static bool isIpad() {
    final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single,
    );
    return data.size.shortestSide > 550 ? true : false;
  }
}
