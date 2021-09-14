/// data : {"user_id":"4","package_id":"2","from":"2021-08-24","to":"2021-09-24","updated_at":"2021-08-24T12:57:57.000000Z","created_at":"2021-08-24T12:57:57.000000Z","id":3}
/// code : 200
/// status : true

class RequestPackageModel {
  Data? _data;
  int? _code;
  bool? _status;

  Data? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  RequestPackageModel({
      Data? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  RequestPackageModel.fromJson(dynamic json) {
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

/// user_id : "4"
/// package_id : "2"
/// from : "2021-08-24"
/// to : "2021-09-24"
/// updated_at : "2021-08-24T12:57:57.000000Z"
/// created_at : "2021-08-24T12:57:57.000000Z"
/// id : 3

class Data {
  int? _userId;
  int? _packageId;
  String? _from;
  String? _to;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  int? get userId => _userId;
  int? get packageId => _packageId;
  String? get from => _from;
  String? get to => _to;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Data({
      int? userId,
      int? packageId,
      String? from, 
      String? to, 
      String? updatedAt, 
      String? createdAt, 
      int? id}){
    _userId = userId;
    _packageId = packageId;
    _from = from;
    _to = to;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _packageId = json['package_id'];
    _from = json['from'];
    _to = json['to'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['package_id'] = _packageId;
    map['from'] = _from;
    map['to'] = _to;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}