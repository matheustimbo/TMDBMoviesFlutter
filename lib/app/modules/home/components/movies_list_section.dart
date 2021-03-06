import 'package:flutter/material.dart';
import 'package:skeleton_animation/skeleton_animation.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_widget.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';
import 'package:tmdbmovies/shared/strings.dart';

class MoviesListSection extends StatefulWidget {
  const MoviesListSection(
      {Key? key,
      required this.movies,
      required this.sectionTitle,
      required this.onEndReached,
      required this.loading,
      required this.loadingMore})
      : super(key: key);

  final List<Movie> movies;
  final String sectionTitle;
  final Function onEndReached;
  final bool loading;
  final bool loadingMore;

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
                if (widget.loadingMore)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
          !widget.loading && widget.movies.length == 0 ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(Strings.MOVIES_NOT_FOUND),
          ) : Container(
            height: 300,
            child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(left: 8),
                itemCount: widget.loading ? 4 : widget.movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => widget.loading
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Skeleton(
                          width: 200,
                          height: 300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      )
                    : MovieWidget(movie: widget.movies[index])),
          )
        ],
      ),
    );
  }
}
