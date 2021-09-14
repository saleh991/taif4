/// data : [{"id":1,"name":"شاليهات","created_at":"2021-07-04T16:15:48.000000Z","updated_at":"2021-07-06T01:29:44.000000Z"},{"id":2,"name":"منتجعات","created_at":"2021-07-06T01:29:54.000000Z","updated_at":"2021-07-06T01:29:54.000000Z"},{"id":3,"name":"مطاعم","created_at":"2021-07-06T01:30:05.000000Z","updated_at":"2021-07-06T01:30:05.000000Z"},{"id":4,"name":"مقاهي","created_at":"2021-07-06T01:30:13.000000Z","updated_at":"2021-07-06T01:30:13.000000Z"},{"id":5,"name":"ملاهي","created_at":"2021-07-06T01:30:24.000000Z","updated_at":"2021-07-06T01:30:24.000000Z"}]
/// code : 200
/// status : true

class LocationsCategory {
  List<Data>? _data;
  int? _code;
  bool? _status;

  List<Data>? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  LocationsCategory({
      List<Data>? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  LocationsCategory.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _code = json['code'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['code'] = _code;
    map['status'] = _status;
    return map;
  }

}

/// id : 1
/// name : "شاليهات"
/// created_at : "2021-07-04T16:15:48.000000Z"
/// updated_at : "2021-07-06T01:29:44.000000Z"

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