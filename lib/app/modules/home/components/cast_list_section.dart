import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/components/cast_widget.dart';
import 'package:tmdbmovies/shared/models/cast_model.dart';

class CastListSection extends StatelessWidget {
  const CastListSection({Key? key, required this.title, required this.cast})
      : super(key: key);

  final String title;
  final List<Cast> cast;

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
          ),
        ),
        Container(
          height: 179,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 8),
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (context, index) => CastWidget(cast: cast[index])),
        )
      ],
    );
  }
}
