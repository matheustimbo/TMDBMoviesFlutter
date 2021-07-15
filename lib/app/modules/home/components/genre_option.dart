import 'package:flutter/material.dart';
import 'package:tmdbmovies/shared/models/movie_details_model.dart';

class GenreOption extends StatelessWidget {
  const GenreOption(
      {Key? key,
      required this.genre,
      required this.isSelected,
      required this.onTapGenre})
      : super(key: key);

  final Genres genre;
  final bool isSelected;
  final Function(Genres genre) onTapGenre;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () {
          onTapGenre(genre);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Text(genre.name!),
          ),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
