import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconVisible extends StatelessWidget {
  const CustomIconVisible(
      {super.key, required this.obsecure, required this.onPressed});
  final bool obsecure;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        obsecure
            ? 'assets/icons/auth/ic_eye_close.svg'
            : 'assets/icons/auth/ic_eye.svg',
      ),
    );
  }
}
