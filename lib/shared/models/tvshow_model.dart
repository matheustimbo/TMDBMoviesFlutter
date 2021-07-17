import 'package:tmdbmovies/shared/utils.dart';

/// poster_path : "/vC324sdfcS313vh9QXwijLIHPJp.jpg"
/// popularity : 47.432451
/// id : 31917
/// backdrop_path : "/rQGBjWNveVeF8f2PGRtS85w9o9r.jpg"
/// vote_average : 5.04
/// overview : "Based on the Pretty Little Liars series of young adult novels by Sara Shepard, the series follows the lives of four girls — Spencer, Hanna, Aria, and Emily — whose clique falls apart after the disappearance of their queen bee, Alison. One year later, they begin receiving messages from someone using the name \"A\" who threatens to expose their secrets — including long-hidden ones they thought only Alison knew."
/// first_air_date : "2010-06-08"
/// origin_country : ["US"]
/// genre_ids : [18,9648]
/// original_language : "en"
/// vote_count : 133
/// name : "Pretty Little Liars"
/// original_name : "Pretty Little Liars"

class Tvshow {
  String? _posterPath;
  double? _popularity;
  int? _id;
  String? _backdropPath;
  num? _voteAverage;
  String? _overview;
  String? _firstAirDate;
  List<String>? _originCountry;
  List<int>? _genreIds;
  String? _originalLanguage;
  int? _voteCount;
  String? _name;
  String? _originalName;

  String? get posterPath => Utils.getFullPosterUrl(_posterPath);
  double? get popularity => _popularity;
  int? get id => _id;
  String? get backdropPath => Utils.getFullBackdropUrl(_backdropPath);
  num? get voteAverage => _voteAverage;
  String? get overview => _overview;
  String? get firstAirDate => _firstAirDate;
  List<String>? get originCountry => _originCountry;
  List<int>? get genreIds => _genreIds;
  String? get originalLanguage => _originalLanguage;
  int? get voteCount => _voteCount;
  String? get name => _name;
  String? get originalName => _originalName;

  Tvshow(
      {String? posterPath,
      double? popularity,
      int? id,
      String? backdropPath,
      num? voteAverage,
      String? overview,
      String? firstAirDate,
      List<String>? originCountry,
      List<int>? genreIds,
      String? originalLanguage,
      int? voteCount,
      String? name,
      String? originalName}) {
    _posterPath = posterPath;
    _popularity = popularity;
    _id = id;
    _backdropPath = backdropPath;
    _voteAverage = voteAverage;
    _overview = overview;
    _firstAirDate = firstAirDate;
    _originCountry = originCountry;
    _genreIds = genreIds;
    _originalLanguage = originalLanguage;
    _voteCount = voteCount;
    _name = name;
    _originalName = originalName;
  }

  Tvshow.fromJson(dynamic json) {
    _posterPath = json["poster_path"];
    _popularity = json["popularity"];
    _id = json["id"];
    _backdropPath = json["backdrop_path"];
    _voteAverage = json["vote_average"];
    _overview = json["overview"];
    _firstAirDate = json["first_air_date"];
    _originCountry = json["origin_country"] != null
        ? json["origin_country"].cast<String>()
        : [];
    _genreIds = json["genre_ids"] != null ? json["genre_ids"].cast<int>() : [];
    _originalLanguage = json["original_language"];
    _voteCount = json["vote_count"];
    _name = json["name"];
    _originalName = json["original_name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["poster_path"] = _posterPath;
    map["popularity"] = _popularity;
    map["id"] = _id;
    map["backdrop_path"] = _backdropPath;
    map["vote_average"] = _voteAverage;
    map["overview"] = _overview;
    map["first_air_date"] = _firstAirDate;
    map["origin_country"] = _originCountry;
    map["genre_ids"] = _genreIds;
    map["original_language"] = _originalLanguage;
    map["vote_count"] = _voteCount;
    map["name"] = _name;
    map["original_name"] = _originalName;
    return map;
  }
}
