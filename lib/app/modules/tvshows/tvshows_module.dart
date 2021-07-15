import 'package:tmdbmovies/app/modules/tvshows/tvshows_Page.dart';
import 'package:tmdbmovies/app/modules/tvshows/tvshows_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TvshowsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TvshowsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TvshowsPage()),
  ];
}
