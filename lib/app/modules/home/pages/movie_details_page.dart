import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tmdbmovies/app/modules/home/components/cast_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_banner.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_info.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_statistics.dart';
import 'package:tmdbmovies/app/modules/home/components/movies_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/popularity_indicator.dart';
import 'package:tmdbmovies/app/modules/home/components/text_section.dart';
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
                                    child: _buildMovieInfoDetails(controller),
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

Widget _buildMovieInfoDetails(MovieDetailsController movieDetailsController) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      MovieBanner(
          height: 250,
          width: 140,
          bannerUrl: movieDetailsController.movie?.posterPath ?? ""),
      Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MovieInfo(
                  title: movieDetailsController.movie?.title,
                  originalTitle: movieDetailsController.movie?.originalTitle,
                  releaseDate: movieDetailsController.movie?.releaseDate),
              SizedBox(
                height: 16,
              ),
              MovieStatistics(
                  voteAverage: movieDetailsController.movie?.voteAverage,
                  movieGenres: movieDetailsController.movie!.genres,
                  runtime: movieDetailsController.movie!.runtime)
            ],
          ),
        ),
      )
    ],
  );
}
