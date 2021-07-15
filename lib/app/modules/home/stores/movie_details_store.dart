import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

part 'movie_details_store.g.dart';

class MovieDetailsStore = MovieDetailsStoreBase with _$MovieDetailsStore;

abstract class MovieDetailsStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  MovieDetails? movie;

  @observable
  double scrolledPixels = 0;

  @computed
  double get backdropHeight => scrolledPixels > 400 ? 0 : 400 - scrolledPixels;

  @computed
  double get backdropBlugSigma => scrolledPixels > 200
      ? 5
      : scrolledPixels <= 0
          ? 0
          : scrolledPixels / 40;

  @computed
  double get appBarOpacity => scrolledPixels > 200
      ? 1
      : scrolledPixels <= 0
          ? 0
          : scrolledPixels / 200;

  @computed
  double get appBarElevation => appBarOpacity * 10;

  @observable
  List<Movie> similarMovies = [];

  @observable
  bool loadingSimilarMovies = false;

  @observable
  bool loadingMoreSimilarMovies = false;

  @observable
  int similarMoviesPage = 1; 
}
