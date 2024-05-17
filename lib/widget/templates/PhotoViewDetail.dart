import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../constant/Constant.dart';
import '../../constant/GlobalUri.dart';

import '../navigation_bar/CustomAppBar.dart';

enum PhotoViewBy {
  network,
  file,
  asset,
}

class PhotoViewDetail extends StatelessWidget {
  const PhotoViewDetail({
    super.key,
    required this.imageUrl,
    this.photoViewBy = PhotoViewBy.network,
    this.action,
    this.isfullPath = false,
  });
  final String imageUrl;
  final PhotoViewBy photoViewBy;
  final Widget? action;
  final bool isfullPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: customAppbar(
        backgroundColor: Colors.black,
        actions: [
          action ?? const SizedBox.shrink(),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: PhotoView(
          gaplessPlayback: true,
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 5,
          imageProvider: imageProvider(),
        ),
      ),
    );
  }

  ImageProvider<Object>? imageProvider() {
    switch (photoViewBy) {
      case PhotoViewBy.network:
        return CachedNetworkImageProvider(
          isfullPath ? imageUrl : "$serverUrl/$assets/$imageUrl",
        );
      case PhotoViewBy.file:
        return FileImage(
          File(imageUrl),
        );

      case PhotoViewBy.asset:
        return AssetImage(imageUrl);
    }
  }
}
