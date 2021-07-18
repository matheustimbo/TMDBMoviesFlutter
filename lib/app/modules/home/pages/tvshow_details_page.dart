import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:tmdbmovies/app/modules/home/components/cast_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_banner.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_info.dart';
import 'package:tmdbmovies/app/modules/home/components/movie_statistics.dart';
import 'package:tmdbmovies/app/modules/home/components/text_section.dart';
import 'package:tmdbmovies/app/modules/home/components/tvshow_list_section.dart';
import 'package:tmdbmovies/app/modules/home/components/tvshow_statistics.dart';
import 'package:tmdbmovies/app/modules/home/components/video_player.dart';
import 'package:tmdbmovies/app/modules/home/controllers/tvshow_details_controller.dart';
import 'package:tmdbmovies/shared/components/image_with_placeholder.dart';
import 'package:tmdbmovies/shared/models/crew_model.dart';
import 'package:tmdbmovies/shared/strings.dart';

class TvshowDetailsPage extends StatefulWidget {
  TvshowDetailsPage({Key? key, required this.id}) : super(key: key);

  final String id;
  final currencyFormatter = NumberFormat.currency(locale: 'en_US');

  static const routeName = '/tvshow';

  @override
  _TvshowDetailsPageState createState() => _TvshowDetailsPageState();
}

class _TvshowDetailsPageState
    extends ModularState<TvshowDetailsPage, TvshowDetailsController> {
  @override
  void initState() {
    super.initState();
    controller.firstFetch(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: Observer(builder: (_) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(controller.loading
                        ? Strings.LOADING
                        : controller.tvshow?.name ?? Strings.TITLE_NOT_FOUND),
                  );
                }),
                background: _buildSliverAppBarBackground(context),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Observer(
                builder: (_) {
                  return controller.loading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: _buildMovieInfoDetails(context),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                TextSection(
                                    title: Strings.OVERVIEW,
                                    text: controller.tvshow?.overview ??
                                        Strings.NOT_FOUND),
                                SizedBox(
                                  height: 32,
                                ),
                                CastListSection(
                                  title: Strings.ACTORS,
                                  cast: controller.tvshowActors,
                                ),
                                TvshowsListSection(
                                  tvshows: controller.similarTvshows,
                                  sectionTitle: Strings.SIMILARS,
                                  onEndReached: () {
                                    controller.fetchSimilarTvshows(
                                        int.parse(widget.id));
                                  },
                                  loading: controller.loadingSimilarTvshows,
                                  loadingMore:
                                      controller.loadingMoreSimilarTvshows,
                                )
                              ],
                            ),
                          ),
                        );
                },
              )
            ]))
          ],
        ));
  }

  Widget _buildSliverAppBarBackground(BuildContext context) {
    return Observer(builder: (_) {
      return Stack(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: !controller.playingVideo
                ? ImageWithPlaceholder(url: controller.tvshow?.backdropPath)
                : VideoPlayer(
                    videoId: controller.tvshowVideos[0].key ?? "",
                    width: MediaQuery.of(context).size.width,
                    height: 400),
          ),
          if (!controller.playingVideo)
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment
                      .bottomCenter, // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black54
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
            ),
          if (controller.hasVideoToPlay && !controller.playingVideo)
            Center(
              child: InkWell(
                onTap: () {
                  controller.togglePlayingVideo();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(
                    controller.playingVideo ? Icons.close : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(80)),
                ),
              ),
            )
        ],
      );
    });
  }

  Widget _buildMovieInfoDetails(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieBanner(
            height: 250,
            width: 140,
            bannerUrl: controller.tvshow?.posterPath ?? ""),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MovieInfo(
                    title: controller.tvshow?.name,
                    originalTitle: controller.tvshow?.originalName,
                    releaseDate: controller.tvshow?.firstAirDate),
                SizedBox(
                  height: 16,
                ),
                TvshowStatistics(
                    voteAverage: controller.tvshow?.voteAverage,
                    movieGenres: controller.tvshow?.genres,
                    numberOfEpisodes: controller.tvshow?.numberOfEpisodes)
              ],
            ),
          ),
        )
      ],
    );
  }
}
