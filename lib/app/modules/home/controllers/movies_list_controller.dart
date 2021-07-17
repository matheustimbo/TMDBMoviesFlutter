import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';
import 'package:tmdbmovies/shared/repository/movie_repository.dart';
import 'package:tmdbmovies/shared/store/movies_store.dart';

class MoviesListController {
  final MoviesStore _moviesStore = Modular.get<MoviesStore>();
  final MovieRepository _movieRepository = Modular.get<MovieRepository>();

  @observable
  ObservableMap<Genre, bool> genreFilterMap = Map<Genre, bool>.fromIterable([],
      key: (item) => item, value: (_) => false).asObservable();

  @action
  void toggleGenre(Genre genre) {
    genreFilterMap.update(genre, (value) => !value);
  }

  List<Movie> filterMovieListByGenre(List<Movie> movieList) {
    bool hasSelectedAnyGenre = false;

    for (int i = 0; i < genreFilterMap.entries.length; i++) {
      if (genreFilterMap.entries.toList()[i].value) {
        hasSelectedAnyGenre = true;
        break;
      }
    }
    return genreFilterMap.entries.length == 0 || !hasSelectedAnyGenre
        ? movieList
        : movieList.where((Movie movie) {
            return movie.genreIds!.any((int id) =>
                genreFilterMap[_moviesStore.genres
                    .firstWhere((genre) => genre.id == id)] ??
                false);
          }).toList();
  }

  @computed
  List<Movie> get filteredPopularMovies {
    return filterMovieListByGenre(_moviesStore.popularMovies);
  }

  @computed
  List<Movie> get filteredUpcomingMovies {
    return filterMovieListByGenre(_moviesStore.upcomingMovies);
  }

  @computed
  List<Movie> get filteredTopRatedMovies {
    return filterMovieListByGenre(_moviesStore.topRatedMovies);
  }

  @computed
  List<Movie> get filteredNowPlayingMovies {
    return filterMovieListByGenre(_moviesStore.nowPlayingMovies);
  }

  @action
  Future<void> firstFetch() async {
    _moviesStore.loadingPopularMovies = true;
    _moviesStore.loadingUpcomingMovies = true;
    _moviesStore.loadingNowPlayingMovies = true;
    _moviesStore.loadingTopRatedMovies = true;
    await Future.wait([
      fetchPopularMovies(),
      fetchUpcomingMovies(),
      fetchTopRatedMovies(),
      fetchNowPlayingMovies(),
      fetchGenres()
    ]);
    _moviesStore.loadingPopularMovies = false;
    _moviesStore.loadingUpcomingMovies = false;
    _moviesStore.loadingNowPlayingMovies = false;
    _moviesStore.loadingTopRatedMovies = false;
  }

  @action
  Future<void> fetchGenres() async {
    _moviesStore.loadingGenres = true;
    try {
      var fetchedGenres = await _movieRepository.getMovieGenres();
      _moviesStore.genres += fetchedGenres;
      _moviesStore.loadingGenres = false;
      genreFilterMap.addAll(Map<Genre, bool>.fromIterable(fetchedGenres,
          key: (item) => item, value: (_) => false).asObservable());
    } on DioError catch (_) {
      _moviesStore.loadingGenres = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchPopularMovies() async {
    _moviesStore.loadingMorePopularMovies = true;
    try {
      var fetchedMovies = await _movieRepository
          .getPopularMovies(_moviesStore.popularMoviesPage);
      _moviesStore.popularMovies += fetchedMovies;
      _moviesStore.popularMoviesPage += 1;
      _moviesStore.loadingMorePopularMovies = false;
    } on DioError catch (_) {
      _moviesStore.loadingMorePopularMovies = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchUpcomingMovies() async {
    _moviesStore.loadingMoreUpcomingMovies = true;
    try {
      var fetchedMovies = await _movieRepository
          .getUpcomingMovies(_moviesStore.upcomingMoviesPage);
      _moviesStore.upcomingMovies += fetchedMovies;
      _moviesStore.upcomingMoviesPage += 1;
      _moviesStore.loadingMoreUpcomingMovies = false;
    } on DioError catch (_) {
      _moviesStore.loadingMoreUpcomingMovies = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchTopRatedMovies() async {
    _moviesStore.loadingMoreTopRatedMovies = true;
    try {
      var fetchedMovies = await _movieRepository
          .getTopRatedMovies(_moviesStore.topRatedMoviesPage);
      _moviesStore.topRatedMovies += fetchedMovies;
      _moviesStore.topRatedMoviesPage += 1;
      _moviesStore.loadingMoreTopRatedMovies = false;
    } on DioError catch (_) {
      _moviesStore.loadingMorePopularMovies = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchNowPlayingMovies() async {
    _moviesStore.loadingNowPlayingMovies = true;
    try {
      var fetchedMovies = await _movieRepository
          .getNowPlayingMovies(_moviesStore.nowPlayingMoviesPage);
      _moviesStore.nowPlayingMovies += fetchedMovies;
      _moviesStore.nowPlayingMoviesPage += 1;
      _moviesStore.loadingMoreNowPlayingMovies = false;
    } on DioError catch (_) {
      _moviesStore.loadingMoreNowPlayingMovies = false;
      print("catch");
    }
  }
}
