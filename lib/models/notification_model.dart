/// status : true
/// code : 200
/// data : [{"id":3,"user_id":4,"url":null,"content":"تم رفض طلب اضافة موقع","seen":1,"created_at":"2021-08-19T00:39:39.000000Z","updated_at":"2021-08-19T11:22:28.000000Z"},{"id":4,"user_id":4,"url":null,"content":"تم قبول طلب اضافة موقع","seen":1,"created_at":"2021-08-19T00:39:45.000000Z","updated_at":"2021-08-19T11:22:28.000000Z"}]

class NotificationModel {
  bool? _status;
  int? _code;
  List<Data>? _data;

  bool? get status => _status;
  int? get code => _code;
  List<Data>? get data => _data;

  NotificationModel({
      bool? status, 
      int? code, 
      List<Data>? data}){
    _status = status;
    _code = code;
    _data = data;
}

  NotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// user_id : 4
/// url : null
/// content : "تم رفض طلب اضافة موقع"
/// seen : 1
/// created_at : "2021-08-19T00:39:39.000000Z"
/// updated_at : "2021-08-19T11:22:28.000000Z"

class Data {
  int? _id;
  int? _userId;
  dynamic? _url;
  String? _content;
  int? _seen;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  dynamic? get url => _url;
  String? get content => _content;
  int? get seen => _seen;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data({
      int? id, 
      int? userId, 
      dynamic? url, 
      String? content, 
      int? seen, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _userId = userId;
    _url = url;
    _content = content;
    _seen = seen;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _url = json['url'];
    _content = json['content'];
    _seen = json['seen'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['url'] = _url;
    map['content'] = _content;
    map['seen'] = _seen;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}