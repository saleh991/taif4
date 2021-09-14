/// data : {"id":1,"name":"سيارت","created_at":"2021-07-04T18:17:36.000000Z","updated_at":"2021-07-04T18:17:48.000000Z"}
/// code : 200
/// status : true

class HarajOnlyCategory {
  Data? _data;
  int? _code;
  bool? _status;

  Data? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  HarajOnlyCategory({
      Data? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  HarajOnlyCategory.fromJson(dynamic json) {
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
/// name : "سيارت"
/// created_at : "2021-07-04T18:17:36.000000Z"
/// updated_at : "2021-07-04T18:17:48.000000Z"

class Data {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data({
      int? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}