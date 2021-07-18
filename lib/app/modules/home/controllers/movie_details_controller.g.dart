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
  Computed<dynamic>? _$canPlayVideoComputed;

  @override
  dynamic get canPlayVideo =>
      (_$canPlayVideoComputed ??= Computed<dynamic>(() => super.canPlayVideo,
              name: '_MovieDetailsControllerBase.canPlayVideo'))
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
  Computed<double>? _$playIconOpacityComputed;

  @override
  double get playIconOpacity => (_$playIconOpacityComputed ??= Computed<double>(
          () => super.playIconOpacity,
          name: '_MovieDetailsControllerBase.playIconOpacity'))
      .value;
  Computed<double>? _$appBarElevationComputed;

  @override
  double get appBarElevation => (_$appBarElevationComputed ??= Computed<double>(
          () => super.appBarElevation,
          name: '_MovieDetailsControllerBase.appBarElevation'))
      .value;
  Computed<bool>? _$hasVideoToPlayComputed;

  @override
  bool get hasVideoToPlay =>
      (_$hasVideoToPlayComputed ??= Computed<bool>(() => super.hasVideoToPlay,
              name: '_MovieDetailsControllerBase.hasVideoToPlay'))
          .value;
  Computed<double>? _$contentScrollPaddingComputed;

  @override
  double get contentScrollPadding => (_$contentScrollPaddingComputed ??=
          Computed<double>(() => super.contentScrollPadding,
              name: '_MovieDetailsControllerBase.contentScrollPadding'))
      .value;
  Computed<Crew?>? _$movieDirectorComputed;

  @override
  Crew? get movieDirector =>
      (_$movieDirectorComputed ??= Computed<Crew?>(() => super.movieDirector,
              name: '_MovieDetailsControllerBase.movieDirector'))
          .value;
  Computed<List<Cast>>? _$movieActorsComputed;

  @override
  List<Cast> get movieActors =>
      (_$movieActorsComputed ??= Computed<List<Cast>>(() => super.movieActors,
              name: '_MovieDetailsControllerBase.movieActors'))
          .value;

  final _$movieCrewAtom = Atom(name: '_MovieDetailsControllerBase.movieCrew');

  @override
  List<Crew> get movieCrew {
    _$movieCrewAtom.reportRead();
    return super.movieCrew;
  }

  @override
  set movieCrew(List<Crew> value) {
    _$movieCrewAtom.reportWrite(value, super.movieCrew, () {
      super.movieCrew = value;
    });
  }

  final _$loadingCrewAtom =
      Atom(name: '_MovieDetailsControllerBase.loadingCrew');

  @override
  bool get loadingCrew {
    _$loadingCrewAtom.reportRead();
    return super.loadingCrew;
  }

  @override
  set loadingCrew(bool value) {
    _$loadingCrewAtom.reportWrite(value, super.loadingCrew, () {
      super.loadingCrew = value;
    });
  }

  final _$movieCastAtom = Atom(name: '_MovieDetailsControllerBase.movieCast');

  @override
  List<Cast> get movieCast {
    _$movieCastAtom.reportRead();
    return super.movieCast;
  }

  @override
  set movieCast(List<Cast> value) {
    _$movieCastAtom.reportWrite(value, super.movieCast, () {
      super.movieCast = value;
    });
  }

  final _$loadingCastAtom =
      Atom(name: '_MovieDetailsControllerBase.loadingCast');

  @override
  bool get loadingCast {
    _$loadingCastAtom.reportRead();
    return super.loadingCast;
  }

  @override
  set loadingCast(bool value) {
    _$loadingCastAtom.reportWrite(value, super.loadingCast, () {
      super.loadingCast = value;
    });
  }

  final _$playingVideoAtom =
      Atom(name: '_MovieDetailsControllerBase.playingVideo');

  @override
  bool get playingVideo {
    _$playingVideoAtom.reportRead();
    return super.playingVideo;
  }

  @override
  set playingVideo(bool value) {
    _$playingVideoAtom.reportWrite(value, super.playingVideo, () {
      super.playingVideo = value;
    });
  }

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

  final _$movieVideosAtom =
      Atom(name: '_MovieDetailsControllerBase.movieVideos');

  @override
  List<Video> get movieVideos {
    _$movieVideosAtom.reportRead();
    return super.movieVideos;
  }

  @override
  set movieVideos(List<Video> value) {
    _$movieVideosAtom.reportWrite(value, super.movieVideos, () {
      super.movieVideos = value;
    });
  }

  final _$firstFetchAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.firstFetch');

  @override
  Future<void> firstFetch(int id) {
    return _$firstFetchAsyncAction.run(() => super.firstFetch(id));
  }

  final _$fetchCrewAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.fetchCrew');

  @override
  Future<void> fetchCrew(int id) {
    return _$fetchCrewAsyncAction.run(() => super.fetchCrew(id));
  }

  final _$fetchCastAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.fetchCast');

  @override
  Future<void> fetchCast(int id) {
    return _$fetchCastAsyncAction.run(() => super.fetchCast(id));
  }

  final _$fetchVideosAsyncAction =
      AsyncAction('_MovieDetailsControllerBase.fetchVideos');

  @override
  Future<void> fetchVideos(int id) {
    return _$fetchVideosAsyncAction.run(() => super.fetchVideos(id));
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
  void togglePlayingVideo() {
    final _$actionInfo = _$_MovieDetailsControllerBaseActionController
        .startAction(name: '_MovieDetailsControllerBase.togglePlayingVideo');
    try {
      return super.togglePlayingVideo();
    } finally {
      _$_MovieDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
movieCrew: ${movieCrew},
loadingCrew: ${loadingCrew},
movieCast: ${movieCast},
loadingCast: ${loadingCast},
playingVideo: ${playingVideo},
loading: ${loading},
movie: ${movie},
scrolledPixels: ${scrolledPixels},
similarMovies: ${similarMovies},
loadingSimilarMovies: ${loadingSimilarMovies},
loadingMoreSimilarMovies: ${loadingMoreSimilarMovies},
similarMoviesPage: ${similarMoviesPage},
movieVideos: ${movieVideos},
backdropHeight: ${backdropHeight},
canPlayVideo: ${canPlayVideo},
backdropBlugSigma: ${backdropBlugSigma},
appBarOpacity: ${appBarOpacity},
playIconOpacity: ${playIconOpacity},
appBarElevation: ${appBarElevation},
hasVideoToPlay: ${hasVideoToPlay},
contentScrollPadding: ${contentScrollPadding},
movieDirector: ${movieDirector},
movieActors: ${movieActors}
    ''';
  }
}
