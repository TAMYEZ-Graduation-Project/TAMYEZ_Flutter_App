import 'package:cached_network_image_ce/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        StatelessWidget,
        BuildContext,
        Widget,
        CircularProgressIndicator,
        Icons,
        Icon;

class NetworkImageCachingWidget extends StatelessWidget {
  final String imageUrl;
  final double? height, width;

  final Widget Function(BuildContext context, ImageProvider imageProvider)?
  imageBuilder;
  final Widget Function(
    BuildContext context,
    Object object,
    StackTrace? stackTrace,
  )?
  errorBuilder;
  final Widget Function(BuildContext context, String url)? placeholder;
  final BoxFit fit;

  const NetworkImageCachingWidget({
    super.key,
    required this.imageUrl,
    this.imageBuilder,
    this.errorBuilder,
    this.placeholder,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imageUrl,
      height: height,
      width: width,
      imageBuilder: imageBuilder,
      placeholder:
          placeholder ??
          (context, url) => const Center(child: CircularProgressIndicator()),
      errorBuilder:
          errorBuilder ??
          (context, object, stackTrace) =>
              const Center(child: Icon(Icons.error)),
    );
  }
}
