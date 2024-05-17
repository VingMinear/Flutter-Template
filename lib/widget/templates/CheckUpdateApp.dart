import 'dart:io';

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class CheckUpdateApp extends StatefulWidget {
  const CheckUpdateApp({super.key, required this.child});
  final Widget child;

  @override
  State<CheckUpdateApp> createState() => _CheckUpdateAppState();
}

class _CheckUpdateAppState extends State<CheckUpdateApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      shouldPopScope: () => false,
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      upgrader: Upgrader(
        durationUntilAlertAgain: const Duration(seconds: 50),
      ),
      child: widget.child,
    );
  }
}
