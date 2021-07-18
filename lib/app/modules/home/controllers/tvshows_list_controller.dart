import 'package:dio/dio.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';
import 'package:tmdbmovies/shared/repository/tvshow_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/shared/store/tvshows_store.dart';
import 'package:mobx/mobx.dart';

class TvshowsListController {
  final TvshowRepository _tvshowRepository = Modular.get<TvshowRepository>();
  final TvshowStore _tvshowStore = Modular.get<TvshowStore>();

  @observable
  ObservableMap<Genre, bool> genreFilterMap = Map<Genre, bool>.fromIterable([],
      key: (item) => item, value: (_) => false).asObservable();

  @action
  void toggleGenre(Genre genre) {
    genreFilterMap.update(genre, (value) => !value);
  }

  List<Tvshow> filterTvshowListByGenre(List<Tvshow> tvshowList) {
    bool hasSelectedAnyGenre = false;

    for (int i = 0; i < genreFilterMap.entries.length; i++) {
      if (genreFilterMap.entries.toList()[i].value) {
        hasSelectedAnyGenre = true;
        break;
      }
    }
    return genreFilterMap.entries.length == 0 || !hasSelectedAnyGenre
        ? tvshowList
        : tvshowList.where((Tvshow movie) {
            return movie.genreIds!.any((int id) =>
                genreFilterMap[_tvshowStore.genres
                    .firstWhere((genre) => genre.id == id)] ??
                false);
          }).toList();
  }

  @computed
  List<Tvshow> get filteredPopularTvshows {
    return filterTvshowListByGenre(_tvshowStore.popularTvshows);
  }

  @computed
  List<Tvshow> get filteredTopRatedTvshows {
    return filterTvshowListByGenre(_tvshowStore.topRatedTvshows);
  }

  @action
  Future<void> firstFetch() async {
    _tvshowStore.loadingPopularTvshows = true;
    _tvshowStore.loadingTopRatedTvshows = true;
    await Future.wait(
        [fetchPopularTvshows(), fetchTopRatedTvshows(), fetchGenres()]);
    _tvshowStore.loadingPopularTvshows = false;
    _tvshowStore.loadingTopRatedTvshows = false;
  }

  @action
  Future<void> fetchGenres() async {
    _tvshowStore.loadingGenres = true;
    try {
      List<Genre> fetchedGenres = await _tvshowRepository.getTvshowGenres();
      _tvshowStore.genres += fetchedGenres;
      _tvshowStore.loadingGenres = false;
      genreFilterMap.addAll(Map<Genre, bool>.fromIterable(fetchedGenres,
          key: (item) => item, value: (_) => false).asObservable());
    } on DioError catch (_) {
      _tvshowStore.loadingGenres = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchPopularTvshows() async {
    _tvshowStore.loadingMorePopularTvshows = true;
    try {
      var fetchedTvshows = await _tvshowRepository
          .getPopularTvshows(_tvshowStore.popularTvshowsPage);
      _tvshowStore.popularTvshows += fetchedTvshows;
      _tvshowStore.popularTvshowsPage += 1;
      _tvshowStore.loadingMorePopularTvshows = false;
    } on DioError catch (_) {
      _tvshowStore.loadingMorePopularTvshows = false;
      print("catch");
    }
  }

  @action
  Future<void> fetchTopRatedTvshows() async {
    _tvshowStore.loadingMoreTopRatedTvshows = true;
    try {
      var fetchedTvshows = await _tvshowRepository
          .getTopRatedTvshows(_tvshowStore.popularTvshowsPage);
      _tvshowStore.topRatedTvshows += fetchedTvshows;
      _tvshowStore.topRatedTvshowsPage += 1;
      _tvshowStore.loadingMoreTopRatedTvshows = false;
    } on DioError catch (_) {
      _tvshowStore.loadingMorePopularTvshows = false;
      print("catch");
    }
  }
}
