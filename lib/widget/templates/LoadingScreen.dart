import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/DeviceInfo.dart';
import '../../styles/Colors.dart';
import '../widgets/LoadingWidget.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.child,
    required this.loading,
    this.bgColor,
    this.loadingAdaptive = false,
  });
  final Color? bgColor;
  final Widget child;
  final bool loading;
  final bool loadingAdaptive;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Visibility(
          visible: loading,
          child: Container(
            color: bgColor ?? AppColor.bgScaffold,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 23),
            child: Container(
              height: Device.isSmallScreen ? 45 : 50,
              width: Device.isSmallScreen ? 45 : 50,
              padding: const EdgeInsets.all(10),
              child: FadeIn(
                child: loadingAdaptive
                    ? Platform.isIOS
                        ? const CupertinoActivityIndicator()
                        : const LoadingWidget()
                    : const LoadingWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
