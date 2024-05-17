import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/Colors.dart';

Widget loadingPagination({
  required bool isLoading,
  required bool isLastPage,
  required List list,
}) {
  double height = Platform.isIOS ? 20 : 25;
  if (isLastPage && isLoading) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: height,
      height: height,
      child: FittedBox(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : CircularProgressIndicator(
                strokeWidth: 2.5,
                color: AppColor.primaryColor,
              ),
      ),
    );
  } else if (isLastPage) {
    return Container(
      height: list.length % 10 == 0 ? height : 10,
      margin: const EdgeInsets.only(top: 8),
    );
  } else {
    return const SizedBox.shrink();
  }
}
