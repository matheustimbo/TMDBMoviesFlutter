import 'package:flutter/material.dart';

class PopularityIndicator extends StatelessWidget {
  const PopularityIndicator({
    Key? key,
    required this.size,
    required this.fontSize,
    required this.voteAverage,
  }) : super(key: key);

  final double size;
  final double fontSize;
  final num? voteAverage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
                strokeWidth: 6, color: Colors.white, value: 1),
          ),
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Colors.orangeAccent,
              value: double.parse('${voteAverage ?? 0}') / 10,
            ),
          ),
          Text(
            '${(((voteAverage ?? 0) * 10).toInt().toString())}%',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
