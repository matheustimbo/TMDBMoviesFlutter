import 'package:tmdbmovies/shared/models/genre_model.dart';
import 'package:tmdbmovies/shared/utils.dart';

class TvshowDetails {
  String? _backdropPath;
  List<Created_by>? _createdBy;
  List<int>? _episodeRunTime;
  String? _firstAirDate;
  List<Genre>? _genres;
  String? _homepage;
  int? _id;
  bool? _inProduction;
  List<String>? _languages;
  String? _lastAirDate;
  Last_episode_to_air? _lastEpisodeToAir;
  String? _name;
  dynamic? _nextEpisodeToAir;
  List<Networks>? _networks;
  int? _numberOfEpisodes;
  int? _numberOfSeasons;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  List<Production_companies>? _productionCompanies;
  List<Production_countries>? _productionCountries;
  List<Seasons>? _seasons;
  List<Spoken_languages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _type;
  double? _voteAverage;
  int? _voteCount;

  String? get backdropPath => Utils.getFullBackdropUrl(_backdropPath);
  List<Created_by>? get createdBy => _createdBy;
  List<int>? get episodeRunTime => _episodeRunTime;
  String? get firstAirDate => _firstAirDate;
  List<Genre>? get genres => _genres;
  String? get homepage => _homepage;
  int? get id => _id;
  bool? get inProduction => _inProduction;
  List<String>? get languages => _languages;
  String? get lastAirDate => _lastAirDate;
  Last_episode_to_air? get lastEpisodeToAir => _lastEpisodeToAir;
  String? get name => _name;
  dynamic? get nextEpisodeToAir => _nextEpisodeToAir;
  List<Networks>? get networks => _networks;
  int? get numberOfEpisodes => _numberOfEpisodes;
  int? get numberOfSeasons => _numberOfSeasons;
  List<String>? get originCountry => _originCountry;
  String? get originalLanguage => _originalLanguage;
  String? get originalName => _originalName;
  String? get overview => _overview;
  double? get popularity => _popularity;
  String? get posterPath => Utils.getFullPosterUrl(_posterPath);
  List<Production_companies>? get productionCompanies => _productionCompanies;
  List<Production_countries>? get productionCountries => _productionCountries;
  List<Seasons>? get seasons => _seasons;
  List<Spoken_languages>? get spokenLanguages => _spokenLanguages;
  String? get status => _status;
  String? get tagline => _tagline;
  String? get type => _type;
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  TvshowDetails(
      {String? backdropPath,
      List<Created_by>? createdBy,
      List<int>? episodeRunTime,
      String? firstAirDate,
      List<Genre>? genres,
      String? homepage,
      int? id,
      bool? inProduction,
      List<String>? languages,
      String? lastAirDate,
      Last_episode_to_air? lastEpisodeToAir,
      String? name,
      dynamic? nextEpisodeToAir,
      List<Networks>? networks,
      int? numberOfEpisodes,
      int? numberOfSeasons,
      List<String>? originCountry,
      String? originalLanguage,
      String? originalName,
      String? overview,
      double? popularity,
      String? posterPath,
      List<Production_companies>? productionCompanies,
      List<Production_countries>? productionCountries,
      List<Seasons>? seasons,
      List<Spoken_languages>? spokenLanguages,
      String? status,
      String? tagline,
      String? type,
      double? voteAverage,
      int? voteCount}) {
    _backdropPath = backdropPath;
    _createdBy = createdBy;
    _episodeRunTime = episodeRunTime;
    _firstAirDate = firstAirDate;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _inProduction = inProduction;
    _languages = languages;
    _lastAirDate = lastAirDate;
    _lastEpisodeToAir = lastEpisodeToAir;
    _name = name;
    _nextEpisodeToAir = nextEpisodeToAir;
    _networks = networks;
    _numberOfEpisodes = numberOfEpisodes;
    _numberOfSeasons = numberOfSeasons;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _seasons = seasons;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _type = type;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  TvshowDetails.fromJson(dynamic json) {
    _backdropPath = json["backdrop_path"];
    if (json["created_by"] != null) {
      _createdBy = [];
      json["created_by"].forEach((v) {
        _createdBy?.add(Created_by.fromJson(v));
      });
    }
    _episodeRunTime = json["episode_run_time"] != null
        ? json["episode_run_time"].cast<int>()
        : [];
    _firstAirDate = json["first_air_date"];
    if (json["genres"] != null) {
      _genres = [];
      json["genres"].forEach((v) {
        _genres?.add(Genre.fromJson(v));
      });
    }
    _homepage = json["homepage"];
    _id = json["id"];
    _inProduction = json["in_production"];
    _languages =
        json["languages"] != null ? json["languages"].cast<String>() : [];
    _lastAirDate = json["last_air_date"];
    _lastEpisodeToAir = json["last_episode_to_air"] != null
        ? Last_episode_to_air.fromJson(json["lastEpisodeToAir"])
        : null;
    _name = json["name"];
    _nextEpisodeToAir = json["next_episode_to_air"];
    if (json["networks"] != null) {
      _networks = [];
      json["networks"].forEach((v) {
        _networks?.add(Networks.fromJson(v));
      });
    }
    _numberOfEpisodes = json["number_of_episodes"];
    _numberOfSeasons = json["number_of_seasons"];
    _originCountry = json["origin_country"] != null
        ? json["origin_country"].cast<String>()
        : [];
    _originalLanguage = json["original_language"];
    _originalName = json["original_name"];
    _overview = json["overview"];
    _popularity = json["popularity"];
    _posterPath = json["poster_path"];
    if (json["production_companies"] != null) {
      _productionCompanies = [];
      json["production_companies"].forEach((v) {
        _productionCompanies?.add(Production_companies.fromJson(v));
      });
    }
    if (json["production_countries"] != null) {
      _productionCountries = [];
      json["production_countries"].forEach((v) {
        _productionCountries?.add(Production_countries.fromJson(v));
      });
    }
    if (json["seasons"] != null) {
      _seasons = [];
      json["seasons"].forEach((v) {
        _seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json["spoken_languages"] != null) {
      _spokenLanguages = [];
      json["spoken_languages"].forEach((v) {
        _spokenLanguages?.add(Spoken_languages.fromJson(v));
      });
    }
    _status = json["status"];
    _tagline = json["tagline"];
    _type = json["type"];
    _voteAverage = json["vote_average"];
    _voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["backdrop_path"] = _backdropPath;
    if (_createdBy != null) {
      map["created_by"] = _createdBy?.map((v) => v.toJson()).toList();
    }
    map["episode_run_time"] = _episodeRunTime;
    map["first_air_date"] = _firstAirDate;
    if (_genres != null) {
      map["genres"] = _genres?.map((v) => v.toJson()).toList();
    }
    map["homepage"] = _homepage;
    map["id"] = _id;
    map["in_production"] = _inProduction;
    map["languages"] = _languages;
    map["last_air_date"] = _lastAirDate;
    if (_lastEpisodeToAir != null) {
      map["last_episode_to_air"] = _lastEpisodeToAir?.toJson();
    }
    map["name"] = _name;
    map["next_episode_to_air"] = _nextEpisodeToAir;
    if (_networks != null) {
      map["networks"] = _networks?.map((v) => v.toJson()).toList();
    }
    map["number_of_episodes"] = _numberOfEpisodes;
    map["number_of_seasons"] = _numberOfSeasons;
    map["origin_country"] = _originCountry;
    map["original_language"] = _originalLanguage;
    map["original_name"] = _originalName;
    map["overview"] = _overview;
    map["popularity"] = _popularity;
    map["poster_path"] = _posterPath;
    if (_productionCompanies != null) {
      map["production_companies"] =
          _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map["production_countries"] =
          _productionCountries?.map((v) => v.toJson()).toList();
    }
    if (_seasons != null) {
      map["seasons"] = _seasons?.map((v) => v.toJson()).toList();
    }
    if (_spokenLanguages != null) {
      map["spoken_languages"] =
          _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map["status"] = _status;
    map["tagline"] = _tagline;
    map["type"] = _type;
    map["vote_average"] = _voteAverage;
    map["vote_count"] = _voteCount;
    return map;
  }
}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class Spoken_languages {
  String? _englishName;
  String? _iso6391;
  String? _name;

  String? get englishName => _englishName;
  String? get iso6391 => _iso6391;
  String? get name => _name;

  Spoken_languages({String? englishName, String? iso6391, String? name}) {
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
  }

  Spoken_languages.fromJson(dynamic json) {
    _englishName = json["english_name"];
    _iso6391 = json["iso_639_1"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["english_name"] = _englishName;
    map["iso_639_1"] = _iso6391;
    map["name"] = _name;
    return map;
  }
}

/// air_date : "2010-12-05"
/// episode_count : 64
/// id : 3627
/// name : "Specials"
/// overview : ""
/// poster_path : "/kMTcwNRfFKCZ0O2OaBZS0nZ2AIe.jpg"
/// season_number : 0

class Seasons {
  String? _airDate;
  int? _episodeCount;
  int? _id;
  String? _name;
  String? _overview;
  String? _posterPath;
  int? _seasonNumber;

  String? get airDate => _airDate;
  int? get episodeCount => _episodeCount;
  int? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get posterPath => _posterPath;
  int? get seasonNumber => _seasonNumber;

  Seasons(
      {String? airDate,
      int? episodeCount,
      int? id,
      String? name,
      String? overview,
      String? posterPath,
      int? seasonNumber}) {
    _airDate = airDate;
    _episodeCount = episodeCount;
    _id = id;
    _name = name;
    _overview = overview;
    _posterPath = posterPath;
    _seasonNumber = seasonNumber;
  }

  Seasons.fromJson(dynamic json) {
    _airDate = json["air_date"];
    _episodeCount = json["episode_count"];
    _id = json["id"];
    _name = json["name"];
    _overview = json["overview"];
    _posterPath = json["poster_path"];
    _seasonNumber = json["season_number"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["air_date"] = _airDate;
    map["episode_count"] = _episodeCount;
    map["id"] = _id;
    map["name"] = _name;
    map["overview"] = _overview;
    map["poster_path"] = _posterPath;
    map["season_number"] = _seasonNumber;
    return map;
  }
}

/// iso_3166_1 : "GB"
/// name : "United Kingdom"

class Production_countries {
  String? _iso31661;
  String? _name;

  String? get iso31661 => _iso31661;
  String? get name => _name;

  Production_countries({String? iso31661, String? name}) {
    _iso31661 = iso31661;
    _name = name;
  }

  Production_countries.fromJson(dynamic json) {
    _iso31661 = json["iso_3166_1"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["iso_3166_1"] = _iso31661;
    map["name"] = _name;
    return map;
  }
}

/// id : 76043
/// logo_path : "/9RO2vbQ67otPrBLXCaC8UMp3Qat.png"
/// name : "Revolution Sun Studios"
/// origin_country : "US"

class Production_companies {
  int? _id;
  String? _logoPath;
  String? _name;
  String? _originCountry;

  int? get id => _id;
  String? get logoPath => _logoPath;
  String? get name => _name;
  String? get originCountry => _originCountry;

  Production_companies(
      {int? id, String? logoPath, String? name, String? originCountry}) {
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
  }

  Production_companies.fromJson(dynamic json) {
    _id = json["id"];
    _logoPath = json["logo_path"];
    _name = json["name"];
    _originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["logo_path"] = _logoPath;
    map["name"] = _name;
    map["origin_country"] = _originCountry;
    return map;
  }
}

/// name : "HBO"
/// id : 49
/// logo_path : "/tuomPhY2UtuPTqqFnKMVHvSb724.png"
/// origin_country : "US"

class Networks {
  String? _name;
  int? _id;
  String? _logoPath;
  String? _originCountry;

  String? get name => _name;
  int? get id => _id;
  String? get logoPath => _logoPath;
  String? get originCountry => _originCountry;

  Networks({String? name, int? id, String? logoPath, String? originCountry}) {
    _name = name;
    _id = id;
    _logoPath = logoPath;
    _originCountry = originCountry;
  }

  Networks.fromJson(dynamic json) {
    _name = json["name"];
    _id = json["id"];
    _logoPath = json["logo_path"];
    _originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["id"] = _id;
    map["logo_path"] = _logoPath;
    map["origin_country"] = _originCountry;
    return map;
  }
}

/// air_date : "2019-05-19"
/// episode_number : 6
/// id : 1551830
/// name : "The Iron Throne"
/// overview : "In the aftermath of the devastating attack on King's Landing, Daenerys must face the survivors."
/// production_code : "806"
/// season_number : 8
/// still_path : "/3x8tJon5jXFa1ziAM93hPKNyW7i.jpg"
/// vote_average : 4.8
/// vote_count : 106

class Last_episode_to_air {
  String? _airDate;
  int? _episodeNumber;
  int? _id;
  String? _name;
  String? _overview;
  String? _productionCode;
  int? _seasonNumber;
  String? _stillPath;
  double? _voteAverage;
  int? _voteCount;

  String? get airDate => _airDate;
  int? get episodeNumber => _episodeNumber;
  int? get id => _id;
  String? get name => _name;
  String? get overview => _overview;
  String? get productionCode => _productionCode;
  int? get seasonNumber => _seasonNumber;
  String? get stillPath => _stillPath;
  double? get voteAverage => _voteAverage;
  int? get voteCount => _voteCount;

  Last_episode_to_air(
      {String? airDate,
      int? episodeNumber,
      int? id,
      String? name,
      String? overview,
      String? productionCode,
      int? seasonNumber,
      String? stillPath,
      double? voteAverage,
      int? voteCount}) {
    _airDate = airDate;
    _episodeNumber = episodeNumber;
    _id = id;
    _name = name;
    _overview = overview;
    _productionCode = productionCode;
    _seasonNumber = seasonNumber;
    _stillPath = stillPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  Last_episode_to_air.fromJson(dynamic json) {
    _airDate = json["air_date"];
    _episodeNumber = json["episode_number"];
    _id = json["id"];
    _name = json["name"];
    _overview = json["overview"];
    _productionCode = json["production_code"];
    _seasonNumber = json["season_number"];
    _stillPath = json["still_path"];
    _voteAverage = json["vote_average"];
    _voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["air_date"] = _airDate;
    map["episode_number"] = _episodeNumber;
    map["id"] = _id;
    map["name"] = _name;
    map["overview"] = _overview;
    map["production_code"] = _productionCode;
    map["season_number"] = _seasonNumber;
    map["still_path"] = _stillPath;
    map["vote_average"] = _voteAverage;
    map["vote_count"] = _voteCount;
    return map;
  }
}

/// id : 9813
/// credit_id : "5256c8c219c2956ff604858a"
/// name : "David Benioff"
/// gender : 2
/// profile_path : "/xvNN5huL0X8yJ7h3IZfGG4O2zBD.jpg"

class Created_by {
  int? _id;
  String? _creditId;
  String? _name;
  int? _gender;
  String? _profilePath;

  int? get id => _id;
  String? get creditId => _creditId;
  String? get name => _name;
  int? get gender => _gender;
  String? get profilePath => _profilePath;

  Created_by(
      {int? id,
      String? creditId,
      String? name,
      int? gender,
      String? profilePath}) {
    _id = id;
    _creditId = creditId;
    _name = name;
    _gender = gender;
    _profilePath = profilePath;
  }

  Created_by.fromJson(dynamic json) {
    _id = json["id"];
    _creditId = json["credit_id"];
    _name = json["name"];
    _gender = json["gender"];
    _profilePath = json["profile_path"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["credit_id"] = _creditId;
    map["name"] = _name;
    map["gender"] = _gender;
    map["profile_path"] = _profilePath;
    return map;
  }
}
