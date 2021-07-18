import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/components/genre_option.dart';
import 'package:tmdbmovies/app/modules/home/components/tvshow_list_section.dart';
import 'package:tmdbmovies/app/modules/home/controllers/tvshows_list_controller.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/store/tvshows_store.dart';

class TvshowsListPage extends StatefulWidget {
  final String title;
  const TvshowsListPage({Key? key, this.title = 'Séries de TV'})
      : super(key: key);
  @override
  TvshowsListPageState createState() => TvshowsListPageState();
}

class TvshowsListPageState extends State<TvshowsListPage>
    with AutomaticKeepAliveClientMixin {
  final TvshowStore _tvshowStore = Modular.get<TvshowStore>();
  final TvshowsListController _tvshowsListController =
      new TvshowsListController();

  @override
  void initState() {
    super.initState();
    _tvshowsListController.firstFetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Observer(builder: (_) {
              return Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 8),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _tvshowsListController.genreFilterMap.entries
                        .map((MapEntry<Genre, bool> genreMapItem) =>
                            GenreOption(
                              genre: genreMapItem.key,
                              isSelected: genreMapItem.value,
                              onTapGenre: _tvshowsListController.toggleGenre,
                            ))
                        .toList(),
                  ),
                ),
              );
            }),
            Observer(builder: (_) {
              return TvshowsListSection(
                  sectionTitle: 'Popular',
                  tvshows: _tvshowsListController.filteredPopularTvshows,
                  onEndReached: _tvshowsListController.fetchPopularTvshows,
                  loading: _tvshowStore.loadingMorePopularTvshows);
            }),
            Observer(builder: (_) {
              return TvshowsListSection(
                  sectionTitle: 'Melhor avaliados',
                  tvshows: _tvshowsListController.filteredTopRatedTvshows,
                  onEndReached: _tvshowsListController.fetchTopRatedTvshows,
                  loading: _tvshowStore.loadingMorePopularTvshows);
            }),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
