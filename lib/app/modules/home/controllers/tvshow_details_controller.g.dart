// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvshow_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TvshowDetailsController on _TvshowDetailsControllerBase, Store {
  Computed<bool>? _$hasVideoToPlayComputed;

  @override
  bool get hasVideoToPlay =>
      (_$hasVideoToPlayComputed ??= Computed<bool>(() => super.hasVideoToPlay,
              name: '_TvshowDetailsControllerBase.hasVideoToPlay'))
          .value;
  Computed<List<Cast>>? _$tvshowActorsComputed;

  @override
  List<Cast> get tvshowActors =>
      (_$tvshowActorsComputed ??= Computed<List<Cast>>(() => super.tvshowActors,
              name: '_TvshowDetailsControllerBase.tvshowActors'))
          .value;

  final _$tvshowCrewAtom =
      Atom(name: '_TvshowDetailsControllerBase.tvshowCrew');

  @override
  List<Crew> get tvshowCrew {
    _$tvshowCrewAtom.reportRead();
    return super.tvshowCrew;
  }

  @override
  set tvshowCrew(List<Crew> value) {
    _$tvshowCrewAtom.reportWrite(value, super.tvshowCrew, () {
      super.tvshowCrew = value;
    });
  }

  final _$loadingCrewAtom =
      Atom(name: '_TvshowDetailsControllerBase.loadingCrew');

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

  final _$tvshowCastAtom =
      Atom(name: '_TvshowDetailsControllerBase.tvshowCast');

  @override
  List<Cast> get tvshowCast {
    _$tvshowCastAtom.reportRead();
    return super.tvshowCast;
  }

  @override
  set tvshowCast(List<Cast> value) {
    _$tvshowCastAtom.reportWrite(value, super.tvshowCast, () {
      super.tvshowCast = value;
    });
  }

  final _$loadingCastAtom =
      Atom(name: '_TvshowDetailsControllerBase.loadingCast');

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
      Atom(name: '_TvshowDetailsControllerBase.playingVideo');

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

  final _$loadingAtom = Atom(name: '_TvshowDetailsControllerBase.loading');

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

  final _$tvshowAtom = Atom(name: '_TvshowDetailsControllerBase.tvshow');

  @override
  TvshowDetails? get tvshow {
    _$tvshowAtom.reportRead();
    return super.tvshow;
  }

  @override
  set tvshow(TvshowDetails? value) {
    _$tvshowAtom.reportWrite(value, super.tvshow, () {
      super.tvshow = value;
    });
  }

  final _$similarTvshowsAtom =
      Atom(name: '_TvshowDetailsControllerBase.similarTvshows');

  @override
  List<Tvshow> get similarTvshows {
    _$similarTvshowsAtom.reportRead();
    return super.similarTvshows;
  }

  @override
  set similarTvshows(List<Tvshow> value) {
    _$similarTvshowsAtom.reportWrite(value, super.similarTvshows, () {
      super.similarTvshows = value;
    });
  }

  final _$loadingSimilarTvshowsAtom =
      Atom(name: '_TvshowDetailsControllerBase.loadingSimilarTvshows');

  @override
  bool get loadingSimilarTvshows {
    _$loadingSimilarTvshowsAtom.reportRead();
    return super.loadingSimilarTvshows;
  }

  @override
  set loadingSimilarTvshows(bool value) {
    _$loadingSimilarTvshowsAtom.reportWrite(value, super.loadingSimilarTvshows,
        () {
      super.loadingSimilarTvshows = value;
    });
  }

  final _$loadingMoreSimilarTvshowsAtom =
      Atom(name: '_TvshowDetailsControllerBase.loadingMoreSimilarTvshows');

  @override
  bool get loadingMoreSimilarTvshows {
    _$loadingMoreSimilarTvshowsAtom.reportRead();
    return super.loadingMoreSimilarTvshows;
  }

  @override
  set loadingMoreSimilarTvshows(bool value) {
    _$loadingMoreSimilarTvshowsAtom
        .reportWrite(value, super.loadingMoreSimilarTvshows, () {
      super.loadingMoreSimilarTvshows = value;
    });
  }

  final _$similarTvshowsPageAtom =
      Atom(name: '_TvshowDetailsControllerBase.similarTvshowsPage');

  @override
  int get similarTvshowsPage {
    _$similarTvshowsPageAtom.reportRead();
    return super.similarTvshowsPage;
  }

  @override
  set similarTvshowsPage(int value) {
    _$similarTvshowsPageAtom.reportWrite(value, super.similarTvshowsPage, () {
      super.similarTvshowsPage = value;
    });
  }

  final _$tvshowVideosAtom =
      Atom(name: '_TvshowDetailsControllerBase.tvshowVideos');

  @override
  List<Video> get tvshowVideos {
    _$tvshowVideosAtom.reportRead();
    return super.tvshowVideos;
  }

  @override
  set tvshowVideos(List<Video> value) {
    _$tvshowVideosAtom.reportWrite(value, super.tvshowVideos, () {
      super.tvshowVideos = value;
    });
  }

  final _$firstFetchAsyncAction =
      AsyncAction('_TvshowDetailsControllerBase.firstFetch');

  @override
  Future<void> firstFetch(int id) {
    return _$firstFetchAsyncAction.run(() => super.firstFetch(id));
  }

  final _$fetchCrewAsyncAction =
      AsyncAction('_TvshowDetailsControllerBase.fetchCrew');

  @override
  Future<void> fetchCrew(int id) {
    return _$fetchCrewAsyncAction.run(() => super.fetchCrew(id));
  }

  final _$fetchCastAsyncAction =
      AsyncAction('_TvshowDetailsControllerBase.fetchCast');

  @override
  Future<void> fetchCast(int id) {
    return _$fetchCastAsyncAction.run(() => super.fetchCast(id));
  }

  final _$fetchVideosAsyncAction =
      AsyncAction('_TvshowDetailsControllerBase.fetchVideos');

  @override
  Future<void> fetchVideos(int id) {
    return _$fetchVideosAsyncAction.run(() => super.fetchVideos(id));
  }

  final _$fetchTvshowDetailsAsyncAction =
      AsyncAction('_TvshowDetailsControllerBase.fetchTvshowDetails');

  @override
  Future<void> fetchTvshowDetails(int id) {
    return _$fetchTvshowDetailsAsyncAction
        .run(() => super.fetchTvshowDetails(id));
  }

  final _$fetchSimilarTvshowsAsyncAction =
      AsyncAction('_TvshowDetailsControllerBase.fetchSimilarTvshows');

  @override
  Future<void> fetchSimilarTvshows(int id) {
    return _$fetchSimilarTvshowsAsyncAction
        .run(() => super.fetchSimilarTvshows(id));
  }

  final _$_TvshowDetailsControllerBaseActionController =
      ActionController(name: '_TvshowDetailsControllerBase');

  @override
  void togglePlayingVideo() {
    final _$actionInfo = _$_TvshowDetailsControllerBaseActionController
        .startAction(name: '_TvshowDetailsControllerBase.togglePlayingVideo');
    try {
      return super.togglePlayingVideo();
    } finally {
      _$_TvshowDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tvshowCrew: ${tvshowCrew},
loadingCrew: ${loadingCrew},
tvshowCast: ${tvshowCast},
loadingCast: ${loadingCast},
playingVideo: ${playingVideo},
loading: ${loading},
tvshow: ${tvshow},
similarTvshows: ${similarTvshows},
loadingSimilarTvshows: ${loadingSimilarTvshows},
loadingMoreSimilarTvshows: ${loadingMoreSimilarTvshows},
similarTvshowsPage: ${similarTvshowsPage},
tvshowVideos: ${tvshowVideos},
hasVideoToPlay: ${hasVideoToPlay},
tvshowActors: ${tvshowActors}
    ''';
  }
}
