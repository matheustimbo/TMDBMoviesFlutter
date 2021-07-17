import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store implements Disposable {
  final pageViewController = PageController();

  @observable
  int currentIndex = 0;

  @override
  void dispose() {
    pageViewController.dispose();
  }

  @action
  void onTapBottomBar(int index) {
    currentIndex = index;
    pageViewController.animateToPage(index,
        duration: Duration(milliseconds: 100), curve: Curves.linearToEaseOut);
  }
}
