/// data : {"id":1,"name":"البرونزي","ads_count":30,"cost":500,"created_at":"2021-06-27T17:31:15.000000Z","updated_at":"2021-06-27T17:31:15.000000Z","comments_enabled":0,"months":1}
/// code : 200
/// status : true

class PackagesIdModel {
  Data? _data;
  int? _code;
  bool? _status;

  Data? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  PackagesIdModel({
      Data? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  PackagesIdModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _code = json['code'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['code'] = _code;
    map['status'] = _status;
    return map;
  }

}

/// id : 1
/// name : "البرونزي"
/// ads_count : 30
/// cost : 500
/// created_at : "2021-06-27T17:31:15.000000Z"
/// updated_at : "2021-06-27T17:31:15.000000Z"
/// comments_enabled : 0
/// months : 1

class Data {
  int? _id;
  String? _name;
  int? _adsCount;
  int? _cost;
  String? _createdAt;
  String? _updatedAt;
  int? _commentsEnabled;
  int? _months;

  int? get id => _id;
  String? get name => _name;
  int? get adsCount => _adsCount;
  int? get cost => _cost;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get commentsEnabled => _commentsEnabled;
  int? get months => _months;

  Data({
      int? id, 
      String? name, 
      int? adsCount, 
      int? cost, 
      String? createdAt, 
      String? updatedAt, 
      int? commentsEnabled, 
      int? months}){
    _id = id;
    _name = name;
    _adsCount = adsCount;
    _cost = cost;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _commentsEnabled = commentsEnabled;
    _months = months;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _adsCount = json['ads_count'];
    _cost = json['cost'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _commentsEnabled = json['comments_enabled'];
    _months = json['months'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['ads_count'] = _adsCount;
    map['cost'] = _cost;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['comments_enabled'] = _commentsEnabled;
    map['months'] = _months;
    return map;
  }

}