import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/home_module.dart';
import 'package:tmdbmovies/app/modules/start/start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends ModularState<StartPage, StartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            onTap: (id) {
              store.currentIndex = id;
              if (id == 0) {
                Modular.to.navigate('/start/home');
              } else if (id == 1) {
                Modular.to.navigate('/start/tvshows');
              }
            },
            currentIndex: store.currentIndex,
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
        },
      ),
    );
  }
}
