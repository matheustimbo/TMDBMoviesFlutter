import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/controllers/home_controller.dart';
import 'package:tmdbmovies/app/modules/home/controllers/movie_details_controller.dart';
import 'package:tmdbmovies/app/modules/home/pages/movie_details_page.dart';
import 'package:tmdbmovies/shared/repository/movie_repository.dart';
import 'package:tmdbmovies/shared/repository/tvshow_repository.dart';
import 'package:tmdbmovies/shared/store/movies_store.dart';
import 'package:tmdbmovies/shared/store/tvshows_store.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MoviesStore()),
    Bind.lazySingleton((i) => MovieRepository()),
    Bind.factory((i) => MovieDetailsController()),
    Bind.lazySingleton((i) => TvshowStore()),
    Bind.lazySingleton((i) => TvshowRepository()),
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('${MovieDetailsPage.routeName}/:id',
        child: (_, args) => MovieDetailsPage(id: args.params['id'])),
  ];
}
