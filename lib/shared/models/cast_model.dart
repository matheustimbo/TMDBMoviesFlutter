import 'package:tmdbmovies/shared/utils.dart';

class Cast {
  bool? _adult;
  int? _gender;
  int? _id;
  String? _knownForDepartment;
  String? _name;
  String? _originalName;
  double? _popularity;
  String? _profilePath;
  String? _character;
  String? _creditId;
  int? _order;

  bool? get adult => _adult;
  int? get gender => _gender;
  int? get id => _id;
  String? get knownForDepartment => _knownForDepartment;
  String? get name => _name;
  String? get originalName => _originalName;
  double? get popularity => _popularity;
  String? get profilePath => Utils.getFullProfileUrl(_profilePath);
  String? get character => _character;
  String? get creditId => _creditId;
  int? get order => _order;

  Cast({
      bool? adult, 
      int? gender, 
      int? id, 
      String? knownForDepartment, 
      String? name, 
      String? originalName, 
      double? popularity, 
      String? profilePath, 
      String? character, 
      String? creditId, 
      int? order}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _character = character;
    _creditId = creditId;
    _order = order;
}

  Cast.fromJson(dynamic json) {
    _adult = json["adult"];
    _gender = json["gender"];
    _id = json["id"];
    _knownForDepartment = json["known_for_department"];
    _name = json["name"];
    _originalName = json["original_name"];
    _popularity = json["popularity"];
    _profilePath = json["profile_path"];
    _character = json["character"];
    _creditId = json["credit_id"];
    _order = json["order"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = _adult;
    map["gender"] = _gender;
    map["id"] = _id;
    map["known_for_department"] = _knownForDepartment;
    map["name"] = _name;
    map["original_name"] = _originalName;
    map["popularity"] = _popularity;
    map["profile_path"] = _profilePath;
    map["character"] = _character;
    map["credit_id"] = _creditId;
    map["order"] = _order;
    return map;
  }

}