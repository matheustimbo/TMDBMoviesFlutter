import 'package:tmdbmovies/shared/utils.dart';

class Movie {
  String? _posterPath;
  bool? _adult;
  String? _overview;
  String? _releaseDate;
  List<int>? _genreIds;
  int? _id;
  String? _originalTitle;
  String? _originalLanguage;
  String? _title;
  String? _backdropPath;
  num? _popularity;
  int? _voteCount;
  bool? _video;
  num? _voteAverage;

  String? get posterPath => Utils.getFullPosterUrl(_posterPath);
  bool? get adult => _adult;
  String? get overview => _overview;
  String? get releaseDate => _releaseDate;
  List<int>? get genreIds => _genreIds;
  int? get id => _id;
  String? get originalTitle => _originalTitle;
  String? get originalLanguage => _originalLanguage;
  String? get title => _title;
  String? get backdropPath => Utils.getFullBackdropUrl(_backdropPath);
  num? get popularity => _popularity;
  int? get voteCount => _voteCount;
  bool? get video => _video;
  num? get voteAverage => _voteAverage;

  Movie(
      {String? posterPath,
      bool? adult,
      String? overview,
      String? releaseDate,
      List<int>? genreIds,
      int? id,
      String? originalTitle,
      String? originalLanguage,
      String? title,
      String? backdropPath,
      num? popularity,
      int? voteCount,
      bool? video,
      double? voteAverage}) {
    _posterPath = posterPath;
    _adult = adult;
    _overview = overview;
    _releaseDate = releaseDate;
    _genreIds = genreIds;
    _id = id;
    _originalTitle = originalTitle;
    _originalLanguage = originalLanguage;
    _title = title;
    _backdropPath = backdropPath;
    _popularity = popularity;
    _voteCount = voteCount;
    _video = video;
    _voteAverage = voteAverage;
  }

  Movie.fromJson(dynamic json) {
    _posterPath = json["poster_path"];
    _adult = json["adult"];
    _overview = json["overview"];
    _releaseDate = json["release_date"];
    _genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    _id = json["id"];
    _originalTitle = json["original_title"];
    _originalLanguage = json["original_language"];
    _title = json["title"];
    _backdropPath = json["backdrop_path"];
    _popularity = json["popularity"];
    _voteCount = json["vote_count"];
    _video = json["video"];
    _voteAverage = json["vote_average"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["poster_path"] = _posterPath;
    map["adult"] = _adult;
    map["overview"] = _overview;
    map["release_date"] = _releaseDate;
    map["genre_ids"] = _genreIds;
    map["id"] = _id;
    map["original_title"] = _originalTitle;
    map["original_language"] = _originalLanguage;
    map["title"] = _title;
    map["backdrop_path"] = _backdropPath;
    map["popularity"] = _popularity;
    map["vote_count"] = _voteCount;
    map["video"] = _video;
    map["vote_average"] = _voteAverage;
    return map;
  }
}
