// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsController on _MovieDetailsControllerBase, Store {
  Computed<double>? _$backdropHeightComputed;

  @override
  double get backdropHeight =>
      (_$backdropHeightComputed ??= Computed<double>(() => super.backdropHeight,
              name: '_MovieDetailsControllerBase.backdropHeight'))
          .value;
  Computed<double>? _$backdropBlugSigmaComputed;

  @override
  double get backdropBlugSigma => (_$backdropBlugSigmaComputed ??=
          Computed<double>(() => super.backdropBlugSigma,
              name: '_MovieDetailsControllerBase.backdropBlugSigma'))
      .value;
  Computed<double>? _$appBarOpacityComputed;

  @override
  double get appBarOpacity =>
      (_$appBarOpacityComputed ??= Computed<double>(() => super.appBarOpacity,
              name: '_MovieDetailsControllerBase.appBarOpacity'))
          .value;
  Computed<double>? _$appBarElevationComputed;

  @override
  double get appBarElevation => (_$appBarElevationComputed ??= Computed<double>(
          () => super.appBarElevation,
          name: '_MovieDetailsControllerBase.appBarElevation'))
      .value;

  final _$loadingAtom = Atom(name: '_MovieDetailsControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$movieAtom = Atom(name: '_MovieDetailsControllerBase.movie');

  @override
  MovieDetails? get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(MovieDetails? value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$scrolledPixelsAtom =
      Atom(name: '_MovieDetailsControllerBase.scrolledPixels');

  @override
  double get scrolledPixels {
    _$scrolledPixelsAtom.reportRead();
    return super.scrolledPixels;
  }

  @override
  set scrolledPixels(double value) {
    _$scrolledPixelsAtom.reportWrite(value, super.scrolledPixels, () {
      super.scrolledPixels = value;
    });
  }

  final _$similarMoviesAtom =
      Atom(name: '_MovieDetailsControllerBase.similarMovies');

  @override
  List<Movie> get similarMovies {
    _$similarMoviesAtom.reportRead();
    return super.similarMovies;
  }

  @override
  set similarMovies(List<Movie> value) {
    _$similarMoviesAtom.reportWrite(value, super.similarMovies, () {
      super.similarMovies = value;
    });
  }

  final _$loadingSimilarMoviesAtom =
      Atom(name: '_MovieDetailsControllerBase.loadingSimilarMovies');

  @override
  bool get loadingSimilarMovies {
    _$loadingSimilarMoviesAtom.reportRead();
    return super.loadingSimilarMovies;
  }

  @override
  set loadingSimilarMovies(bool value) {
    _$loadingSimilarMoviesAtom.reportWrite(value, super.loadingSimilarMovies,
        () {
      super.loadingSimilarMovies = value;
    });
  }

  final _$loadingMoreSimilarMoviesAtom =
      Atom(name: '_MovieDetailsControllerBase.loadingMoreSimilarMovies');

  @override
  bool get loadingMoreSimilarMovies {
    _$loadingMoreSimilarMoviesAtom.reportRead();
    return super.loadingMoreSimilarMovies;
  }

  @override
  set loadingMoreSimilarMovies(bool value) {
    _$loadingMoreSimilarMoviesAtom
        .reportWrite(value, super.loadingMoreSimilarMovies, () {
      super.loadingMoreSimilarMovies = value;
    });
  }

  final _$similarMoviesPageAtom =
      Atom(name: '_MovieDetailsControllerBase.similarMoviesPage');

  @override
  int get similarMoviesPage {
    _$similarMoviesPageAtom.reportRead();
    return super.similarMoviesPage;
  }

  @override
  set similarMoviesPage(int value) {
    _$similarMoviesPageAtom.reportWrite(value, super.similarMoviesPage, () {
      super.similarMoviesPage = value;
    });
  }

  final _$firstFetchAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.firstFetch');

  @override
  Future<void> firstFetch(int id) {
    return _$firstFetchAsyncAction.run(() => super.firstFetch(id));
  }

  final _$fetchMovieDetailsAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.fetchMovieDetails');

  @override
  Future<void> fetchMovieDetails(int id) {
    return _$fetchMovieDetailsAsyncAction
        .run(() => super.fetchMovieDetails(id));
  }

  final _$fetchSimilarMoviesAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.fetchSimilarMovies');

  @override
  Future<void> fetchSimilarMovies(int id) {
    return _$fetchSimilarMoviesAsyncAction
        .run(() => super.fetchSimilarMovies(id));
  }

  final _$_MovieDetailsControllerBaseActionController =
      ActionController(name: '_MovieDetailsControllerBase');

  @override
  dynamic scrollListener(ScrollNotification scrollNotification) {
    final _$actionInfo = _$_MovieDetailsControllerBaseActionController
        .startAction(name: '_MovieDetailsControllerBase.scrollListener');
    try {
      return super.scrollListener(scrollNotification);
    } finally {
      _$_MovieDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
movie: ${movie},
scrolledPixels: ${scrolledPixels},
similarMovies: ${similarMovies},
loadingSimilarMovies: ${loadingSimilarMovies},
loadingMoreSimilarMovies: ${loadingMoreSimilarMovies},
similarMoviesPage: ${similarMoviesPage},
backdropHeight: ${backdropHeight},
backdropBlugSigma: ${backdropBlugSigma},
appBarOpacity: ${appBarOpacity},
appBarElevation: ${appBarElevation}
    ''';
  }
}
