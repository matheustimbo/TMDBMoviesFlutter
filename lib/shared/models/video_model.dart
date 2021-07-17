/// id : "572003f992514121f30003c6"
/// iso_639_1 : "en"
/// iso_3166_1 : "US"
/// key : "BpJYNVhGf1s"
/// name : "\"The Game Begins\""
/// site : "YouTube"
/// size : 720
/// type : "Trailer"

class Video {
  String? _id;
  String? _iso6391;
  String? _iso31661;
  String? _key;
  String? _name;
  String? _site;
  int? _size;
  String? _type;

  String? get id => _id;
  String? get iso6391 => _iso6391;
  String? get iso31661 => _iso31661;
  String? get key => _key;
  String? get name => _name;
  String? get site => _site;
  int? get size => _size;
  String? get type => _type;

  Video(
      {String? id,
      String? iso6391,
      String? iso31661,
      String? key,
      String? name,
      String? site,
      int? size,
      String? type}) {
    _id = id;
    _iso6391 = iso6391;
    _iso31661 = iso31661;
    _key = key;
    _name = name;
    _site = site;
    _size = size;
    _type = type;
  }

  Video.fromJson(dynamic json) {
    _id = json["id"];
    _iso6391 = json["iso_639_1"];
    _iso31661 = json["iso_3166_1"];
    _key = json["key"];
    _name = json["name"];
    _site = json["site"];
    _size = json["size"];
    _type = json["type"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["iso_639_1"] = _iso6391;
    map["iso_3166_1"] = _iso31661;
    map["key"] = _key;
    map["name"] = _name;
    map["site"] = _site;
    map["size"] = _size;
    map["type"] = _type;
    return map;
  }
}
