import 'package:flutter/material.dart';
import 'package:phum_assocation/utils/extensions/Extension.dart';

import '../../styles/Colors.dart';
import '../../styles/Style.dart';
import 'CustomButton.dart';

class DoubleButton extends StatelessWidget {
  const DoubleButton({
    super.key,
    this.onConfirm,
    this.space,
    this.txtBtnCfn,
    this.txtBtnCancel,
    this.onCancel,
    this.btnCfnColor,
    this.btnCancelColor,
    this.btnCfnBorder,
    this.btnCancelBorder,
  });
  final void Function()? onConfirm;
  final double? space;
  final String? txtBtnCfn;
  final String? txtBtnCancel;
  final Color? btnCfnColor, btnCancelColor;
  final Color? btnCfnBorder, btnCancelBorder;
  final void Function()? onCancel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            backgroundColor: btnCancelColor ?? Colors.transparent,
            textStyle: AppText.normalStyle(fontSize: 14).copyWith(
              color: AppColor.errorColor,
            ),
            borderColor: btnCancelBorder ?? AppColor.errorColor,
            title: txtBtnCancel ?? 'cancel',
            onPress: onCancel ??
                () {
                  context.pop();
                },
          ),
        ),
        SizedBox(width: space ?? 20),
        Expanded(
          child: CustomButton(
            title: txtBtnCfn ?? 'cf',
            textStyle: AppText.normalStyle(fontSize: 14).copyWith(
              color: AppColor.whiteColor,
            ),
            borderColor: btnCfnColor ?? btnCfnBorder,
            backgroundColor: btnCfnColor,
            onPress: onConfirm ?? () {},
          ),
        ),
      ],
    );
  }
}
