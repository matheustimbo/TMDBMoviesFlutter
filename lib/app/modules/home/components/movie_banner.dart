import 'package:flutter/material.dart';
import 'package:tmdbmovies/shared/components/image_with_placeholder.dart';

class MovieBanner extends StatelessWidget {
  const MovieBanner(
      {Key? key,
      required this.height,
      required this.width,
      required this.bannerUrl})
      : super(key: key);

  final double height;
  final double width;
  final String bannerUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        height: height,
        width: width,
        child: ImageWithPlaceholder(url: bannerUrl),
      ),
    );
  }
}
