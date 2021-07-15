import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/pages/movie_details_page.dart';
import 'package:tmdbmovies/app/modules/home/stores/movie_details_store.dart';
import 'package:tmdbmovies/shared/repository/movie_repository.dart';
import 'package:tmdbmovies/shared/store/movies_store.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MoviesStore()),
    Bind.lazySingleton((i) => MovieRepository()),
    Bind.instance<MovieDetailsStore>(MovieDetailsStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('${MovieDetailsPage.routeName}/:id',
        child: (_, args) => MovieDetailsPage(id: args.params['id'])),
  ];
}
