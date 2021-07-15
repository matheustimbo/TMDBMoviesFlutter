import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/app/modules/home/stores/movie_details_store.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import 'package:tmdbmovies/shared/repository/movie_repository.dart';

class MovieDetailsController {
  final MovieRepository _movieRepository = Modular.get<MovieRepository>();
  final MovieDetailsStore _movieDetailsStore = Modular.get<MovieDetailsStore>();

  @action
  Future<void> firstFetch(int id) async {
    _movieDetailsStore.loadingSimilarMovies = true;
    fetchMovieDetails(id);
    fetchSimilarMovies(id);
  }

  @action
  Future<void> fetchMovieDetails(int id) async {
    _movieDetailsStore.loading = true;
    try {
      var fetchedMovie = await _movieRepository.getMovieDetailsById(id);
      _movieDetailsStore.movie = fetchedMovie;
      _movieDetailsStore.loading = false;
    } on DioError catch (_) {
      _movieDetailsStore.loading = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchSimilarMovies(int id) async {
    _movieDetailsStore.loadingSimilarMovies = true;
    try {
      var fetchedMovies = await _movieRepository.getSimilarMovies(
          id, _movieDetailsStore.similarMoviesPage);
      _movieDetailsStore.similarMovies += fetchedMovies;
      _movieDetailsStore.similarMoviesPage += 1;
      _movieDetailsStore.loadingMoreSimilarMovies = false;
      _movieDetailsStore.loadingSimilarMovies = false;
    } on DioError catch (_) {
      _movieDetailsStore.loadingMoreSimilarMovies = false;
      _movieDetailsStore.loadingSimilarMovies = false;
      print("catch");
    }
  }

  @action
  scrollListener(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.axisDirection == AxisDirection.down ||
        scrollNotification.metrics.axisDirection == AxisDirection.up) {
      _movieDetailsStore.scrolledPixels = scrollNotification.metrics.pixels;
    }
  }
}
