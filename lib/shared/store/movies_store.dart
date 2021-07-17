import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

part 'movies_store.g.dart';

class MoviesStore = MoviesStoreBase with _$MoviesStore;

abstract class MoviesStoreBase with Store {
  @observable
  List<Movie> popularMovies = [];

  @observable
  int popularMoviesPage = 1;

  @observable
  bool loadingPopularMovies = false;

  @observable
  bool loadingMorePopularMovies = false;

  @observable
  List<Movie> upcomingMovies = [];

  @observable
  int upcomingMoviesPage = 1;

  @observable
  bool loadingUpcomingMovies = false;

  @observable
  bool loadingMoreUpcomingMovies = false;

  @observable
  List<Movie> topRatedMovies = [];

  @observable
  int topRatedMoviesPage = 1;

  @observable
  bool loadingTopRatedMovies = false;

  @observable
  bool loadingMoreTopRatedMovies = false;

  @observable
  List<Movie> nowPlayingMovies = [];

  @observable
  int nowPlayingMoviesPage = 1;

  @observable
  bool loadingNowPlayingMovies = false;

  @observable
  bool loadingMoreNowPlayingMovies = false;

  @observable
  List<Genre> genres = [];

  @observable
  bool loadingGenres = false;
}
