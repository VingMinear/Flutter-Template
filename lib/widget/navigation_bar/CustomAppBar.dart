import 'package:flutter/material.dart';
import 'package:phum_assocation/utils/extensions/Extension.dart';
import 'package:phum_assocation/widget/widgets/SvgIcon.dart';

AppBar customAppbar({
  String? title,
  Color? titleColor,
  bool? autoLeading,
  double? titleSpace,
  bool? centerTitle = false,
  bool leadingDefualt = true,
  List<Widget>? actions,
  Widget? leadingIcon,
  double? elevation,
  Color? backgroundColor,
  List<Shadow>? titleShadows,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: elevation,
    title: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        title ?? '',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          shadows: titleShadows,
          color: titleColor ?? Colors.black,
        ),
      ),
    ),
    centerTitle: centerTitle,
    leading: leadingDefualt
        ? Builder(builder: (ctx) {
            return IconButton(
              onPressed: () {
                ctx.pop();
              },
              icon: const SvgIcon('assets/icons/ic_back.svg'),
            );
          })
        : leadingIcon,
    bottom: bottom,
    automaticallyImplyLeading: autoLeading ?? true,
    titleSpacing: titleSpace ?? 0,
    actions: actions,
  );
}
