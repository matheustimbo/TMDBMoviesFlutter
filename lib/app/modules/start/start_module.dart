import 'package:tmdbmovies/app/modules/home/home_module.dart';
import 'package:tmdbmovies/app/modules/start/controllers/start_controller.dart';
import 'package:tmdbmovies/app/modules/start/start_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/tvshows/tvshows_module.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => StartController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/start', child: (_, args) => StartPage(), children: [
      ModuleRoute('/home', module: HomeModule()),
      ModuleRoute('/tvshows', module: TvshowsModule())
    ]),
  ];
}
