import 'package:flutter/material.dart';

import '../../styles/Colors.dart';
import '../../styles/Style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final void Function()? onPress;
  final double? highlightElevation, borderRadius, space, width;
  final TextStyle? textStyle;
  final Color? splashColor, backgroundColor, borderColor;
  final Widget? icon;
  final EdgeInsetsGeometry? padding, paddingText;
  final Decoration? decoration;
  const CustomButton({
    super.key,
    this.title,
    required this.onPress,
    this.textStyle,
    this.highlightElevation,
    this.borderRadius,
    this.splashColor,
    this.backgroundColor,
    this.icon,
    this.space,
    this.padding,
    this.decoration,
    this.borderColor,
    this.paddingText,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width ?? double.infinity,
      decoration: decoration,
      child: MaterialButton(
        clipBehavior: Clip.none,
        highlightColor: AppColor.primaryColor.withAlpha(10),
        splashColor: splashColor,
        color: backgroundColor ?? AppColor.primaryColor,
        highlightElevation: highlightElevation ?? 0,
        onPressed: onPress ?? () {},
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          borderSide: BorderSide(
            width: borderColor == null ? 0 : 1,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: paddingText ?? const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title ?? "TAP",
                    style: textStyle ??
                        AppText.normalStyle().copyWith(
                          color: AppColor.whiteColor,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: space,
              ),
              icon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
