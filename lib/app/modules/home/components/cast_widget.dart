import 'package:flutter/material.dart';
import 'package:tmdbmovies/shared/components/image_with_placeholder.dart';
import 'package:tmdbmovies/shared/models/cast_model.dart';
import 'package:tmdbmovies/shared/strings.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key, required this.cast}) : super(key: key);

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Container(
        width: 100,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(78),
              child: Container(
                height: 78,
                width: 78,
                child: ImageWithPlaceholder(url: cast.profilePath,),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              cast.name ?? Strings.NOT_FOUND,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              cast.character ?? Strings.NOT_FOUND,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
