import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:skeleton_animation/skeleton_animation.dart';
import 'package:tmdbmovies/shared/components/image_with_placeholder.dart';
import 'package:tmdbmovies/shared/models/movie_model.dart';
import 'package:tmdbmovies/app/modules/home/pages/movie_details_page.dart';

class UpcomingMoviesList extends StatefulWidget {
  UpcomingMoviesList(
      {Key? key, required this.upcomingMovies, required this.loading})
      : super(key: key);

  final List<Movie> upcomingMovies;
  final bool loading;

  @override
  _UpcomingMoviesListState createState() => _UpcomingMoviesListState();
}

class _UpcomingMoviesListState extends State<UpcomingMoviesList> {
  late PageController _pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.95);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Vindo aí',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Container(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: widget.loading
                  ? Skeleton(
                      height: 300,
                      width: MediaQuery.of(context).size.width - 32, 
                      borderRadius: BorderRadius.circular(24),)
                  : InkWell(
                      onTap: () {
                        Modular.to.pushNamed(
                            '${MovieDetailsPage.routeName}/${widget.upcomingMovies[index].id}');
                      },
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                              child: ImageWithPlaceholder(
                                url: widget.upcomingMovies[index].backdropPath,
                                alignment: Alignment(-pageOffset + index, 0),
                              ),
                            ),
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
                                  tileMode: TileMode
                                      .repeated, // repeats the gradient over the canvas
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    widget.upcomingMovies[index].title ?? "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: widget.loading ? 1 : widget.upcomingMovies.length,
          ),
        ),
      ],
    );
  }
}
