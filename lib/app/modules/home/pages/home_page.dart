import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/components/genre_option.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import 'package:tmdbmovies/app/modules/home/controllers/home_controller.dart';
import 'package:tmdbmovies/app/modules/home/pages/movies_list_page.dart';
import 'package:tmdbmovies/app/modules/home/pages/tvshows_list_page.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';
import '../../../../shared/store/movies_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: controller.pageViewController,
          children: [MovieListPage(), TvshowsListPage()],
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: Observer(builder: (_) {
          return BottomNavigationBar(
            onTap: controller.onTapBottomBar,
            currentIndex: controller.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Filmes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Séries',
              ),
            ],
          );
        }));
  }
}
