import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo(
      {Key? key,
      required this.title,
      required this.originalTitle,
      required this.releaseDate})
      : super(key: key);

  final String? title;
  final String? originalTitle;
  final String? releaseDate;

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
              title ?? "",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              originalTitle ?? "",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
                'Lançamento: ${releaseDate!.replaceAll('-', '/').split('/').reversed.join('/')}')
          ],
        ),
      ),
    );
  }
}
