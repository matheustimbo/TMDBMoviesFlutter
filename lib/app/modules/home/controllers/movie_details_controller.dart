import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import 'package:tmdbmovies/shared/models/video_model.dart';
import 'package:tmdbmovies/shared/repository/movie_repository.dart';

part 'movie_details_controller.g.dart';

@Injectable()
class MovieDetailsController = _MovieDetailsControllerBase
    with _$MovieDetailsController;

abstract class _MovieDetailsControllerBase with Store implements Disposable {
  @override
  void dispose() {}

  final MovieRepository _movieRepository = Modular.get<MovieRepository>();

  @observable
  bool playingVideo = false;

  @observable
  bool loading = false;

  @observable
  MovieDetails? movie;

  @observable
  double scrolledPixels = 0;

  @computed
  double get backdropHeight => scrolledPixels > 400 ? 0 : 400 - scrolledPixels;

  @computed
  get canPlayVideo => scrolledPixels <= 50;

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
  double get playIconOpacity => scrolledPixels > 100
      ? 0
      : scrolledPixels > 50
          ? 1 - ((scrolledPixels - 50) / 50)
          : 1;

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

  @observable
  List<Video> movieVideos = [];

  @computed
  bool get hasVideoToPlay => movieVideos.length > 0;

  @computed
  double get contentScrollPadding => playingVideo ? 432 : 250;

  @action
  void togglePlayingVideo() {
    playingVideo = !playingVideo;
  }

  @action
  Future<void> firstFetch(int id) async {
    loadingSimilarMovies = true;
    fetchMovieDetails(id);
    fetchSimilarMovies(id);
    fetchVideos(id);
  }

  @action
  Future<void> fetchVideos(int id) async {
    try {
      var fetchedVideos = await _movieRepository.getMovieYoutubeVideos(id);
      movieVideos = fetchedVideos;
    } on DioError catch (_) {
      print("catch");
    }
  }

  @action
  Future<void> fetchMovieDetails(int id) async {
    loading = true;
    try {
      var fetchedMovie = await _movieRepository.getMovieDetailsById(id);
      movie = fetchedMovie;
      loading = false;
    } on DioError catch (_) {
      loading = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchSimilarMovies(int id) async {
    loadingMoreSimilarMovies = true;
    try {
      var fetchedMovies =
          await _movieRepository.getSimilarMovies(id, similarMoviesPage);
      similarMovies += fetchedMovies;
      similarMoviesPage += 1;
      loadingMoreSimilarMovies = false;
      loadingSimilarMovies = false;
    } on DioError catch (_) {
      loadingMoreSimilarMovies = false;
      loadingSimilarMovies = false;
      print("catch");
    }
  }

  @action
  scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axisDirection == AxisDirection.down ||
        scrollNotification.metrics.axisDirection == AxisDirection.up) {
      scrolledPixels = scrollNotification.metrics.pixels;
    }
  }
}
