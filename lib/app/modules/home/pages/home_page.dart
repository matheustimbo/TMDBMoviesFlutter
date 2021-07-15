import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/components/genre_option.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import 'package:tmdbmovies/app/modules/home/controllers/home_controller.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';
import '../../../../shared/store/movies_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, MoviesStore> {
  final MoviesStore _moviesStore = Modular.get<MoviesStore>();
  final HomeController _homeController = new HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.firstFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filmes'),
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
                      children: _homeController.genreFilterMap.entries
                          .map((MapEntry<Genres, bool> genreMapItem) =>
                              GenreOption(
                                genre: genreMapItem.key,
                                isSelected: genreMapItem.value,
                                onTapGenre: _homeController.toggleGenre,
                              ))
                          .toList(),
                    ),
                  ),
                );
              }),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _homeController.filteredPopularMovies,
                        sectionTitle: 'Popular',
                        onEndReached: _homeController.fetchPopularMovies,
                        loading: _moviesStore.loadingMorePopularMovies,
                      )),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _homeController.filteredNowPlayingMovies,
                        sectionTitle: 'Em cartaz',
                        onEndReached: _homeController.fetchNowPlayingMovies,
                        loading: _moviesStore.loadingMoreNowPlayingMovies,
                      )),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _homeController.filteredUpcomingMovies,
                        sectionTitle: 'Vindo aí',
                        onEndReached: _homeController.fetchUpcomingMovies,
                        loading: _moviesStore.loadingMoreUpcomingMovies,
                      )),
              Observer(
                  builder: (_) => MoviesListSection(
                        movies: _homeController.filteredTopRatedMovies,
                        sectionTitle: 'Melhor avaliados',
                        onEndReached: _homeController.fetchTopRatedMovies,
                        loading: _moviesStore.loadingMoreTopRatedMovies,
                      )),
            ],
          ),
        ));
  }
}
