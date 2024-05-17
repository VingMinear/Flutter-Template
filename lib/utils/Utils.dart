import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:phum_assocation/utils/GlobalContext.dart';
import 'package:vibration/vibration.dart';

import 'DeviceInfo.dart';
import 'Log.dart';
import 'helper/BaseHelper.dart';

double resize(double size) {
  var resize = 1.0;
  if (Device.isXtraSmallScreen) {
    resize = 0.8;
  } else if (Device.isSmallScreen) {
    resize = 0.95;
  } else if (Device.isNormalScreen) {
    resize = 1;
  } else if (Device.isMediumScreen) {
    resize = 1.2;
  } else {
    resize = 1.3;
  }
  return size * resize;
}

Duration animateTabBar() => const Duration(milliseconds: 250);
TextScaler get txtScale {
  var scale = 1.2;
  if (Device.isXtraSmallScreen) {
    scale = 0.85;
  } else if (Device.isSmallScreen) {
    scale = 0.95;
  } else if (Device.isNormalScreen) {
    scale = 1;
  } else if (Device.isMediumScreen) {
    scale = 1.1;
  } else {
    scale = 1.2;
  }
  return TextScaler.linear(scale);
}

Future onLogout() async {
  // loadingDialog();
  // await NotificationHandler.logOut();
  await FlutterAppBadger.removeBadge();
}

vibration({int? repeat, int? duration}) async {
  if (await Vibration.hasVibrator() ?? false) {
    Vibration.vibrate(duration: duration ?? 200, repeat: repeat ?? -1);
  }
}

/// Use on future.onError to catch error via api status such as 500 or defualt...
Future checkCatchResponseError(ErrorModel error,
    {bool barrierColor = true, void Function()? onCancel}) async {
  if (error.statusCode == null ||
      error.statusCode == 500 ||
      error.statusCode == 502) {
    // await alertDialog(
    //   barrierColor: barrierColor,
    //   title: 'Ops',
    //   desc: 'invalid_server',
    //   barrierDismissible: false,
    //   txtBtnCancel: 'try_again',
    //   onCancel: onCancel ??
    //       () {
    //         pop();
    //       },
    // );
  }

  Log.error("$error");
}

Future<bool> checkConnectivityState() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  bool isConnect = false;
  if (connectivityResult.contains(ConnectivityResult.wifi)) {
    Log.warning('Connected to a Wi-Fi network');
    isConnect = true;
  } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
    Log.warning('Connected to a mobile network');
    isConnect = true;
  } else if (connectivityResult.contains(ConnectivityResult.none)) {
    isConnect = false;
    Log.warning('Not connected to any network');
  }
  return isConnect;
}

bool checkPagination({
  required bool isRefreshing,
  required bool isLoading,
  required double maxScrollExtent,
  required double scrollPosition,
}) {
  if (scrollPosition == maxScrollExtent && !isRefreshing && !isLoading) {
    return true;
  } else {
    return false;
  }
}

bool checkIsRefreshing(ScrollUpdateNotification notification) {
  if (notification.metrics.pixels < 0) {
    return true;
  } else {
    return false;
  }
}

bool isStrongPassword(String password) {
  return password.length >= 8 &&
      RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)').hasMatch(password);
}

double appHeight({double percent = 1}) {
  return MediaQuery.of(GlobalContext.context).size.height * percent;
}

double appWidth({double percent = 1}) {
  return MediaQuery.of(GlobalContext.context).size.width * percent;
}

dismissKeyboard() {
  final FocusScopeNode currentFocus = FocusScope.of(GlobalContext.context);

  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

DateTime? currentBackPressTime;
Future<bool> onWillPopExit() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = now;
    // showToast('click_again_exit');
    return Future.value(false);
  }
  return Future.value(true);
}
