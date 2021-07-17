import 'package:mobx/mobx.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';
part 'tvshows_store.g.dart';

class TvshowStore = _TvshowStoreBase with _$TvshowStore;

abstract class _TvshowStoreBase with Store {
  @observable
  List<Tvshow> popularTvshows = [];

  @observable
  int popularTvshowsPage = 1;

  @observable
  bool loadingPopularTvshows = false;

  @observable
  bool loadingMorePopularTvshows = false;

  @observable
  List<Tvshow> topRatedTvshows = [];

  @observable
  int topRatedTvshowsPage = 1;

  @observable
  bool loadingTopRatedTvshows = false;

  @observable
  bool loadingMoreTopRatedTvshows = false;

  @observable
  List<Genre> genres = [];

  @observable
  bool loadingGenres = false;
}
