import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/app/modules/home/home_repository.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository _homeRepository = Modular.get<HomeRepository>();

  @observable
  List<Movie> popularMovies = [];

  @observable
  int page = 1;

  @observable
  bool loadingPopularMovies = false;

  @observable
  bool loadingMorePopularMovies = false;

  @action
  Future<void> firstFetch() async {
    loadingPopularMovies = true;
    await fetchPopularMovies();
    loadingPopularMovies = false;
  }

  @action
  Future<void> fetchPopularMovies() async {
    loadingMorePopularMovies = true;
    try {
      var fetchedMovies = await _homeRepository.getPopularMovies(page);
      popularMovies += fetchedMovies;
      page += 1;
    } on DioError catch (_) {
      loadingPopularMovies = false;
      loadingMorePopularMovies = false;
      print("catch");
    }
  }
}
