import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import './home_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    _homeStore.fetchPopularMovies();

    return Scaffold(
        appBar: AppBar(
          title: Text('Filmes'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Observer(
                  builder: (_) => MoviesListSection(
                      movies: _homeStore.popularMovies,
                      sectionTitle: 'Popular')),
            ],
          ),
        ));
  }
}
