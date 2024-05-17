import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

Widget logoCompany({bool bySplash = true}) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            'assets/images/gov.png',
            scale: 3,
          ),
        ),
        SizedBox(height: bySplash ? 25 : 10),
        SvgPicture.asset(
          'assets/biz_logo.svg',
          width: bySplash ? 150 : 120,
        ),
        const SizedBox(height: 30),
      ],
    ),
  );
}
