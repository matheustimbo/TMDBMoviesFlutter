import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
              Image.network(movie.posterPath ?? "", fit: BoxFit.cover),
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
                          movie.title ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(movie.originalTitle ?? ""),
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
