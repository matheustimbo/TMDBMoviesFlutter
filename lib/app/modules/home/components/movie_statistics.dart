import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/components/popularity_indicator.dart';
import 'package:tmdbmovies/shared/models/genre_model.dart';

class MovieStatistics extends StatelessWidget {
  const MovieStatistics({ Key? key,required this.voteAverage, required this.movieGenres, required this.runtime }) : super(key: key);

  final double? voteAverage;
  final List<Genre>? movieGenres;
  final int? runtime;

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
                voteAverage: voteAverage,
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
                        '${movieGenres!.map((item) => item.name).join(', ')}.'),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                        'Duração: ${runtime.toString()}m')
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