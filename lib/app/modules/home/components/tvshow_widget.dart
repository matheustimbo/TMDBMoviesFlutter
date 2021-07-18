import 'package:flutter/material.dart';
import 'package:tmdbmovies/shared/components/image_with_placeholder.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';

class TvshowWidget extends StatelessWidget {
  const TvshowWidget({Key? key, required this.tvshow}) : super(key: key);

  final Tvshow tvshow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 200,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(children: [
              ImageWithPlaceholder(url: tvshow.posterPath),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment
                        .bottomCenter, // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Colors.transparent,
                      Colors.black54
                    ], // red to yellow
                    tileMode: TileMode
                        .repeated, // repeats the gradient over the canvas
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tvshow.name ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
