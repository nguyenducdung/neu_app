import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageLoader extends StatelessWidget {
  final String? assetPath;
  final String? imageUrl;
  final String? svgPath;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageLoader({super.key,
    this.assetPath,
    this.imageUrl,
    this.svgPath,
    this.width = 40.0,
    this.height = 40.0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (assetPath != null) {
      return Image.asset(
        assetPath!,
        width: width,
        height: height,
        fit: fit,
        cacheHeight: height.round(),
        cacheWidth: width.round(),
      );
    } else if (imageUrl != null) {
      return CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        cacheKey: imageUrl!,
        memCacheHeight: height.round(),
        memCacheWidth: width.round(),
      );
    } else if (svgPath != null) {
      return SvgPicture.asset(
        svgPath!,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
      );
    } else {
      return Container();
    }
  }
}
