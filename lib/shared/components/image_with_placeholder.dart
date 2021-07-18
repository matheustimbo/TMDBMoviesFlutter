import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithPlaceholder extends StatelessWidget {
  const ImageWithPlaceholder({Key? key, required this.url, this.alignment})
      : super(key: key);

  final String? url;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? "",
      fit: BoxFit.cover,
      alignment: alignment ?? Alignment(0, 0),
      progressIndicatorBuilder: (_, __, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: Colors.white,
        ),
      ),
      errorWidget: (_, __, ___) => Center(child: Icon(Icons.error)),
    );
  }
}
