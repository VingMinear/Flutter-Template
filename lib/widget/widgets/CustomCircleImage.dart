import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:phum_assocation/utils/extensions/Extension.dart';

import '../../styles/Colors.dart';
import '../templates/PhotoViewDetail.dart';
import 'CachedImage.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage({
    super.key,
    this.size,
    required this.url,
    this.showBorder = true,
    this.borderColor,
    required this.photoViewBy,
    this.borderStroke,
    this.onTap,
  });
  final void Function()? onTap;
  final double? size, borderStroke;
  final String url;
  final bool showBorder;
  final Color? borderColor;
  final PhotoViewBy photoViewBy;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap ??
              () async {
                await context.push(
                  PhotoViewDetail(
                    imageUrl: url,
                    photoViewBy: photoViewBy,
                  ),
                );
              },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            width: size ?? 80,
            height: size ?? 80,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: image(),
          ),
        ),
        Visibility(
          visible: showBorder,
          child: Positioned.fill(
            child: IgnorePointer(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor ?? AppColor.whiteColor,
                    style: BorderStyle.solid,
                    width: borderStroke ?? 1.5,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget image() {
    if (photoViewBy == PhotoViewBy.file) {
      return Image.file(File(url), fit: BoxFit.cover);
    } else if (photoViewBy == PhotoViewBy.network) {
      return CachedImage(imgUrl: url);
    } else {
      return Image.asset(url, fit: BoxFit.cover);
    }
  }
}
