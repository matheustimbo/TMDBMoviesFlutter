import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_widget.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

class MoviesListSection extends StatefulWidget {
  const MoviesListSection(
      {Key? key,
      required this.movies,
      required this.sectionTitle,
      required this.onEndReached,
      required this.loading})
      : super(key: key);

  final List<Movie> movies;
  final String sectionTitle;
  final Function onEndReached;
  final bool loading;

  @override
  _MoviesListSectionState createState() => _MoviesListSectionState();
}

class _MoviesListSectionState extends State<MoviesListSection> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !widget.loading) {
        widget.onEndReached();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text(
                  widget.sectionTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                if (widget.loading)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(left: 8),
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    MovieWidget(movie: widget.movies[index])),
          )
        ],
      ),
    );
  }
}
