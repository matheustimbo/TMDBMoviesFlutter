import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/shared/strings.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.APP_TITLE,
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
    ).modular();
  }
}
