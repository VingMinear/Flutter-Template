import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.icon,
      {super.key, this.width, this.defaultSize = false, this.color});
  final String icon;
  final Color? color;
  final bool defaultSize;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: defaultSize ? null : width ?? 25,
    );
  }
}
