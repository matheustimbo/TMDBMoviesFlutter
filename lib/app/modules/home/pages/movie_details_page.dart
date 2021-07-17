import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import 'package:tmdbmovies/app/modules/home/controllers/movie_details_controller.dart';
import 'package:tmdbmovies/shared/utils.dart';

class MovieDetailsPage extends StatefulWidget {
  static const routeName = '/movie';

  final String id;

  MovieDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState
    extends ModularState<MovieDetailsPage, MovieDetailsController> {
  @override
  void initState() {
    super.initState();
    controller.firstFetch(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: controller.appBarElevation,
            backgroundColor: Colors.black.withOpacity(controller.appBarOpacity),
            title: Observer(builder: (_) {
              return Text(controller.loading
                  ? 'Carregando'
                  : controller.movie?.title ?? "");
            }),
          ),
          body: Observer(
            builder: (_) {
              return controller.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        controller.scrollListener(notification);
                        return true;
                      },
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: controller.backdropHeight,
                                width: double.infinity,
                                child: Image.network(
                                    controller.movie?.backdropPath ?? "",
                                    fit: BoxFit.cover),
                              ),
                              ClipRRect(
                                // Clip it cleanly.
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: controller.backdropBlugSigma,
                                      sigmaY: controller.backdropBlugSigma),
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.1),
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 250),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: MovieDetails(
                                        movieDetailsController: controller),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text(
                                      'Resumo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child:
                                        Text(controller.movie?.overview ?? ''),
                                  ),
                                  MoviesListSection(
                                    movies: controller.similarMovies,
                                    sectionTitle: 'Similares',
                                    onEndReached: () {
                                      controller.fetchSimilarMovies(
                                          int.parse(widget.id));
                                    },
                                    loading:
                                        controller.loadingMoreSimilarMovies,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
            },
          ));
    });
  }
}

class MovieDetails extends StatelessWidget {
  const MovieDetails({
    Key? key,
    required MovieDetailsController movieDetailsController,
  })  : _movieDetailsController = movieDetailsController,
        super(key: key);

  final MovieDetailsController _movieDetailsController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieBanner(movieDetailsController: _movieDetailsController),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieInfo(movieDetailsController: _movieDetailsController),
                SizedBox(
                  height: 16,
                ),
                MovieStatistics(movieDetailsController: _movieDetailsController)
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    Key? key,
    required MovieDetailsController movieDetailsController,
  })  : _movieDetailsController = movieDetailsController,
        super(key: key);

  final MovieDetailsController _movieDetailsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 188,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _movieDetailsController.movie!.title ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 16,
            ),
            Text(_movieDetailsController.movie!.releaseDate!
                .replaceAll('-', '/')
                .split('/')
                .reversed
                .join('/'))
          ],
        ),
      ),
    );
  }
}

class MovieStatistics extends StatelessWidget {
  const MovieStatistics({
    Key? key,
    required MovieDetailsController movieDetailsController,
  })  : _movieDetailsController = movieDetailsController,
        super(key: key);

  final MovieDetailsController _movieDetailsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 188,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black87,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            PopularityIndicator(
                movieDetailsController: _movieDetailsController),
            Container(
              width: MediaQuery.of(context).size.width - 188 - 32 - 75,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${_movieDetailsController.movie!.genres!.map((item) => item.name).join(', ')}.'),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        'Duração: ${_movieDetailsController.movie!.runtime.toString()}m')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularityIndicator extends StatelessWidget {
  const PopularityIndicator({
    Key? key,
    required MovieDetailsController movieDetailsController,
  })  : _movieDetailsController = movieDetailsController,
        super(key: key);

  final MovieDetailsController _movieDetailsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: CircularProgressIndicator(
                strokeWidth: 6, color: Colors.white, value: 1),
          ),
          SizedBox(
            width: 75,
            height: 75,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Colors.purple,
              value: double.parse(
                      '${_movieDetailsController.movie!.voteAverage}') /
                  10,
            ),
          ),
          Text(
            '${((_movieDetailsController.movie!.voteAverage! * 10).toInt().toString())}%',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class MovieBanner extends StatelessWidget {
  const MovieBanner({
    Key? key,
    required MovieDetailsController movieDetailsController,
  })  : _movieDetailsController = movieDetailsController,
        super(key: key);

  final MovieDetailsController _movieDetailsController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox(
        height: 250,
        width: 140,
        child: Image.network(_movieDetailsController.movie?.posterPath ?? "",
            fit: BoxFit.cover),
      ),
    );
  }
}
