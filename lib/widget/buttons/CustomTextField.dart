import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/Colors.dart';
import '../../styles/Style.dart';

class CustomTextField extends StatelessWidget {
  final double? borderRadius, borderWidth;
  final TextEditingController? controller;
  final String? hint, validatText, labelText;
  final TextInputType? textInputType;
  final bool enable, readOnly, validator;
  final bool? autoFocus;

  final EdgeInsetsGeometry? containPadding;
  final TextInputAction? textInputAction;
  final double? height;
  final int? maxLine;
  final Widget? prefixIcon, suffixIcon, prefix, label;
  final TextStyle? hintTextStyle, textStyle;
  final Color? borderWidthColor, backGroundColor;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final OutlineInputBorder? border,
      focusBorder,
      enableBorder,
      disableBorder,
      errorBorder;
  final TextAlignVertical? textAlignVertical;
  final Function(String text)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool isObsecured;
  const CustomTextField({
    super.key,
    this.borderRadius,
    this.borderWidth,
    this.hint,
    this.hintTextStyle,
    this.textStyle,
    this.borderWidthColor,
    this.backGroundColor,
    this.onChange,
    this.border,
    this.focusBorder,
    this.enableBorder,
    this.disableBorder,
    this.errorBorder,
    this.controller,
    this.enable = true,
    this.textInputType,
    this.maxLine,
    this.height,
    this.autoFocus,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.containPadding,
    this.prefix,
    this.textAlignVertical,
    this.onFieldSubmitted,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
    this.focusNode,
    this.validator = false,
    this.maxLength,
    this.validatText,
    this.isObsecured = false,
    this.labelText,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, rebuild) {
      return TextFormField(
        enableSuggestions: true,
        autocorrect: false,
        style: textStyle ?? AppText.normalStyle(),
        textInputAction: textInputAction ?? TextInputAction.done,
        controller: controller,
        obscureText: isObsecured,
        obscuringCharacter: '●',
        enabled: enable,
        autofocus: autoFocus ?? false,
        readOnly: readOnly,
        buildCounter: (context,
            {required currentLength, required isFocused, maxLength}) {
          return maxLength != null
              ? Text(
                  "$currentLength/$maxLength",
                  style: TextStyle(
                    color: AppColor.cardDarkColor,
                  ),
                )
              : null;
        },
        maxLength: maxLength,
        validator: validator
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return validatText ?? 'pls_fill';
                }
                return null;
              }
            : null,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        maxLines: maxLine ?? 1,
        focusNode: focusNode,
        textAlignVertical: textAlignVertical,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: hintTextStyle ?? AppText.hintStyle(),
          prefixIcon: prefixIcon,
          prefix: prefix,
          labelText: labelText,
          label: label,
          labelStyle: hintTextStyle ?? AppText.hintStyle(),
          prefixStyle: AppText.normalStyle(),
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderWidthColor ?? Colors.grey[200]!,
                ),
              ),
          enabledBorder: errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderWidthColor ?? Colors.grey[200]!,
                ),
              ),
          focusedBorder: focusBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderWidthColor ?? Colors.grey[200]!,
                ),
              ),
          suffixIcon: suffixIcon,
          disabledBorder: disableBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 5),
                borderSide: BorderSide(
                  width: borderWidth ?? 1,
                  color: borderWidthColor ?? Colors.grey[200]!,
                ),
              ),
          fillColor: backGroundColor ?? Colors.transparent,
          filled: true,
          errorStyle: AppText.errorStyle(),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: Colors.red,
            ),
          ),
          contentPadding:
              containPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        ),
        onChanged: onChange,
      );
    });
  }
}
