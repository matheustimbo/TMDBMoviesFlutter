import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/shared/components/image_with_placeholder.dart';
import 'package:tmdbmovies/app/modules/home/components/popularity_indicator.dart';
import 'package:tmdbmovies/app/modules/home/pages/movie_details_page.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed('${MovieDetailsPage.routeName}/${movie.id}');
        },
        child: SizedBox(
          width: 200,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Stack(children: [
              ImageWithPlaceholder(url: movie.posterPath),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment
                        .bottomCenter, // 10% of the width, so there are ten blinds.
                    colors: <Color>[
                      Colors.black54,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (movie.popularity != null)
                          Text(
                            movie.popularity!.round().toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        Column(
                          children: [
                            PopularityIndicator(
                              fontSize: 12,
                              size: 48,
                              voteAverage: movie.voteAverage,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(movie.voteCount.toString())
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(movie.originalTitle ?? ""),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
