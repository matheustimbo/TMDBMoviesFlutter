import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_widget.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

class MoviesListSection extends StatelessWidget {
  const MoviesListSection(
      {Key? key, required this.movies, required this.sectionTitle})
      : super(key: key);

  final List<Movie> movies;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              sectionTitle,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 8),
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    MovieWidget(movie: movies[index])),
          )
        ],
      ),
    );
  }
}
