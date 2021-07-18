import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tmdbmovies/app/modules/home/components/cast_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/popularity_indicator.dart';
import 'package:tmdbmovies/app/modules/home/components/video_player.dart';
import 'package:tmdbmovies/app/modules/home/controllers/movie_details_controller.dart';
import 'package:tmdbmovies/shared/utils.dart';

class MovieDetailsPage extends StatefulWidget {
  static const routeName = '/movie';

  final String id;
  final currencyFormatter = NumberFormat.currency(locale: 'en_US');

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
                              Container(
                                height: controller.backdropHeight,
                                width: double.infinity,
                                child: !controller.playingVideo
                                    ? Image.network(
                                        controller.movie?.backdropPath ?? "",
                                        fit: BoxFit.cover)
                                    : VideoPlayer(
                                        videoId:
                                            controller.movieVideos[0].key ?? "",
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 300),
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
                            child: AnimatedPadding(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              padding: EdgeInsets.only(
                                  top: controller.contentScrollPadding),
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
                                  TextSection(
                                      title: 'Resumo',
                                      text: controller.movie?.overview ??
                                          "Não encontrado"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextSection(
                                      title: 'Diretor(a)',
                                      text: controller.movieDirector?.name ??
                                          "Não encontrado"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextSection(
                                      title: 'Orçamento',
                                      text: controller.movie?.budget != null
                                          ? widget.currencyFormatter
                                              .format(controller.movie!.budget)
                                              .toString()
                                          : "Não encontrado"),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  TextSection(
                                      title: 'Receita',
                                      text: controller.movie?.revenue != null
                                          ? widget.currencyFormatter
                                              .format(controller.movie!.revenue)
                                              .toString()
                                          : "Não encontrado"),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  CastListSection(
                                    title: 'Atores',
                                    cast: controller.movieActors,
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
                          ),
                          if (controller.hasVideoToPlay)
                            Opacity(
                              opacity: controller.playIconOpacity,
                              child: Container(
                                height: controller.backdropHeight,
                                width: double.infinity,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      if (controller.canPlayVideo) {
                                        controller.togglePlayingVideo();
                                      }
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      child: Icon(
                                        controller.playingVideo
                                            ? Icons.close
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius:
                                              BorderRadius.circular(80)),
                                    ),
                                  ),
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

class TextSection extends StatelessWidget {
  const TextSection({Key? key, required this.title, required this.text})
      : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text),
        )
      ],
    );
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
                fontSize: 16,
                voteAverage: _movieDetailsController.movie?.voteAverage,
                size: 75),
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
