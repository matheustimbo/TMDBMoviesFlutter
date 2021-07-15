import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/tvshows/tvshows_store.dart';
import 'package:flutter/material.dart';

class TvshowsPage extends StatefulWidget {
  final String title;
  const TvshowsPage({Key? key, this.title = 'TvshowsPage'}) : super(key: key);
  @override
  TvshowsPageState createState() => TvshowsPageState();
}
class TvshowsPageState extends State<TvshowsPage> {
  final TvshowsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}