import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/components/genre_option.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/upcoming_movies_list.dart';
import 'package:tmdbmovies/app/modules/home/controllers/movies_list_controller.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/strings.dart';
import '../../../../shared/store/movies_store.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage>
    with AutomaticKeepAliveClientMixin {
  final MoviesStore _moviesStore = Modular.get<MoviesStore>();
  final MoviesListController _moviesListController = new MoviesListController();

  @override
  void initState() {
    super.initState();
    _moviesListController.firstFetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.MOVIES),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Observer(builder: (_) {
                return UpcomingMoviesList(
                  upcomingMovies: _moviesStore.upcomingMovies,
                  loading: _moviesStore.loadingUpcomingMovies,
                );
              }),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 8),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _moviesListController.genreFilterMap.entries
                          .map((MapEntry<Genre, bool> genreMapItem) =>
                              GenreOption(
                                genre: genreMapItem.key,
                                isSelected: genreMapItem.value,
                                onTapGenre: _moviesListController.toggleGenre,
                              ))
                          .toList(),
                    ),
                  ),
                );
              }),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _moviesListController.filteredPopularMovies,
                        sectionTitle: Strings.POPULAR,
                        onEndReached: _moviesListController.fetchPopularMovies,
                        loading: _moviesStore.loadingPopularMovies,
                        loadingMore: _moviesStore.loadingMorePopularMovies,
                      )),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _moviesListController.filteredNowPlayingMovies,
                        sectionTitle: Strings.NOW_PLAYING,
                        onEndReached:
                            _moviesListController.fetchNowPlayingMovies,
                        loading: _moviesStore.loadingNowPlayingMovies,
                        loadingMore: _moviesStore.loadingMoreNowPlayingMovies,
                      )),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _moviesListController.filteredTopRatedMovies,
                        sectionTitle: Strings.TOP_RATED,
                        onEndReached: _moviesListController.fetchTopRatedMovies,
                        loading: _moviesStore.loadingTopRatedMovies,
                        loadingMore: _moviesStore.loadingMoreTopRatedMovies,
                      )),
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
