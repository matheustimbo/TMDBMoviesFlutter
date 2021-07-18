import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/shared/models/cast_model.dart';
import 'package:tmdbmovies/shared/models/crew_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';
import 'package:tmdbmovies/shared/models/video_model.dart';
import 'package:tmdbmovies/shared/repository/tvshow_repository.dart';
import 'package:tmdbmovies/shared/models/tvshow_details_model.dart';

part 'tvshow_details_controller.g.dart';

class TvshowDetailsController = _TvshowDetailsControllerBase
    with _$TvshowDetailsController;

abstract class _TvshowDetailsControllerBase with Store implements Disposable {
  @override
  void dispose() {}

  final TvshowRepository _tvshowRepository = Modular.get<TvshowRepository>();

  @observable
  List<Crew> tvshowCrew = [];

  @observable
  bool loadingCrew = false;

  @observable
  List<Cast> tvshowCast = [];

  @observable
  bool loadingCast = false;

  @observable
  bool playingVideo = false;

  @observable
  bool loading = false;

  @observable
  TvshowDetails? tvshow;

  @observable
  List<Tvshow> similarTvshows = [];

  @observable
  bool loadingSimilarTvshows = false;

  @observable
  bool loadingMoreSimilarTvshows = false;

  @observable
  int similarTvshowsPage = 1;

  @observable
  List<Video> tvshowVideos = [];

  @computed
  bool get hasVideoToPlay => tvshowVideos.length > 0;

  @computed
  List<Cast> get tvshowActors => tvshowCast
      .where((Cast cast) => cast.knownForDepartment == 'Acting')
      .toList();

  @action
  void togglePlayingVideo() {
    playingVideo = !playingVideo;
  }

  @action
  Future<void> firstFetch(int id) async {
    loadingSimilarTvshows = true;
    fetchTvshowDetails(id);
    fetchSimilarTvshows(id);
    fetchVideos(id);
    fetchCrew(id);
    fetchCast(id);
  }

  @action
  Future<void> fetchCrew(int id) async {
    loadingCrew = true;
    try {
      var fetchedCrew = await _tvshowRepository.getTvshowCrew(id);
      tvshowCrew = fetchedCrew;
      loadingCrew = false;
    } on DioError catch (_) {
      loadingCrew = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchCast(int id) async {
    loadingCast = true;
    try {
      var fetchedCast = await _tvshowRepository.getTvshowCast(id);
      tvshowCast = fetchedCast;
      loadingCast = false;
    } on DioError catch (_) {
      loadingCast = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchVideos(int id) async {
    try {
      var fetchedVideos = await _tvshowRepository.getTvshowYoutubeVideos(id);
      tvshowVideos = fetchedVideos;
    } on DioError catch (_) {
      print("catch");
    }
  }

  @action
  Future<void> fetchTvshowDetails(int id) async {
    loading = true;
    try {
      var fetchedTvshow = await _tvshowRepository.getTvshowDetailsById(id);
      tvshow = fetchedTvshow;
      loading = false;
    } on DioError catch (_) {
      loading = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchSimilarTvshows(int id) async {
    loadingMoreSimilarTvshows = true;
    try {
      var fetchedMovies =
          await _tvshowRepository.getSimilarTvshows(id, similarTvshowsPage);
      similarTvshows += fetchedMovies;
      similarTvshowsPage += 1;
      loadingMoreSimilarTvshows = false;
      loadingSimilarTvshows = false;
    } on DioError catch (_) {
      loadingMoreSimilarTvshows = false;
      loadingSimilarTvshows = false;
      print("catch");
    }
  }
}
