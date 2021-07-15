// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsStore on MovieDetailsStoreBase, Store {
  Computed<double>? _$backdropHeightComputed;

  @override
  double get backdropHeight =>
      (_$backdropHeightComputed ??= Computed<double>(() => super.backdropHeight,
              name: 'MovieDetailsStoreBase.backdropHeight'))
          .value;
  Computed<double>? _$backdropBlugSigmaComputed;

  @override
  double get backdropBlugSigma => (_$backdropBlugSigmaComputed ??=
          Computed<double>(() => super.backdropBlugSigma,
              name: 'MovieDetailsStoreBase.backdropBlugSigma'))
      .value;
  Computed<double>? _$appBarOpacityComputed;

  @override
  double get appBarOpacity =>
      (_$appBarOpacityComputed ??= Computed<double>(() => super.appBarOpacity,
              name: 'MovieDetailsStoreBase.appBarOpacity'))
          .value;
  Computed<double>? _$appBarElevationComputed;

  @override
  double get appBarElevation => (_$appBarElevationComputed ??= Computed<double>(
          () => super.appBarElevation,
          name: 'MovieDetailsStoreBase.appBarElevation'))
      .value;

  final _$loadingAtom = Atom(name: 'MovieDetailsStoreBase.loading');

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

  final _$movieAtom = Atom(name: 'MovieDetailsStoreBase.movie');

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
      Atom(name: 'MovieDetailsStoreBase.scrolledPixels');

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

  final _$similarMoviesAtom = Atom(name: 'MovieDetailsStoreBase.similarMovies');

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
      Atom(name: 'MovieDetailsStoreBase.loadingSimilarMovies');

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
      Atom(name: 'MovieDetailsStoreBase.loadingMoreSimilarMovies');

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
      Atom(name: 'MovieDetailsStoreBase.similarMoviesPage');

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
