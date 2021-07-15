/// poster_path : "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg"
/// adult : false
/// overview : "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences."
/// release_date : "2016-08-03"
/// genre_ids : [14,28,80]
/// id : 297761
/// original_title : "Suicide Squad"
/// original_language : "en"
/// title : "Suicide Squad"
/// backdrop_path : "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg"
/// popularity : 48.261451
/// vote_count : 1466
/// video : false
/// vote_average : 5.91

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
  double? _popularity;
  int? _voteCount;
  bool? _video;
  num? _voteAverage;

  String? get posterPath => _posterPath;
  bool? get adult => _adult;
  String? get overview => _overview;
  String? get releaseDate => _releaseDate;
  List<int>? get genreIds => _genreIds;
  int? get id => _id;
  String? get originalTitle => _originalTitle;
  String? get originalLanguage => _originalLanguage;
  String? get title => _title;
  String? get backdropPath => _backdropPath;
  double? get popularity => _popularity;
  int? get voteCount => _voteCount;
  bool? get video => _video;
  num? get voteAverage => _voteAverage;

  Movie({
      String? posterPath, 
      bool? adult, 
      String? overview, 
      String? releaseDate, 
      List<int>? genreIds, 
      int? id, 
      String? originalTitle, 
      String? originalLanguage, 
      String? title, 
      String? backdropPath, 
      double? popularity, 
      int? voteCount, 
      bool? video, 
      double? voteAverage}){
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

  String getFullPosterUrl() {
    return 'https://image.tmdb.org/t/p/w500/${this._posterPath}';
  }

  String getFullBackdropUrl() {
    return 'https://image.tmdb.org/t/p/w1280/${this._backdropPath}';
  }

}