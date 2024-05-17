import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constant/Constant.dart';
import '../../constant/GlobalUri.dart';
import 'LoadingWidget.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imgUrl,
    this.fit,
    this.raduis,
    this.isImgfullPath = false,
  });
  final BoxFit? fit;
  final String imgUrl;
  final bool isImgfullPath;
  final double? raduis;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: isImgfullPath ? imgUrl : "$serverUrl/$assets/$imgUrl",
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: LoadingWidget(
          strokeWidth: 2.7,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/Product_No_Img.jpg',
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
