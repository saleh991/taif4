/// status : true
/// code : 200
/// data : [{"id":3,"user_id":4,"subject_id":1,"content":"test comment","created_at":"2021-08-28T15:20:12.000000Z","updated_at":"2021-08-28T15:20:12.000000Z","subject_class":"App\\Models\\Estate"},{"id":5,"user_id":4,"subject_id":1,"content":"test comment","created_at":"2021-09-04T01:47:36.000000Z","updated_at":"2021-09-04T01:47:36.000000Z","subject_class":"App\\Models\\Estate"}]

class EstateCommentModel {
  bool? _status;
  int? _code;
  List<Data>? _data;

  bool? get status => _status;
  int? get code => _code;
  List<Data>? get data => _data;

  EstateCommentModel({
      bool? status, 
      int? code, 
      List<Data>? data}){
    _status = status;
    _code = code;
    _data = data;
}

  EstateCommentModel.fromJson(dynamic json) {
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
/// subject_id : 1
/// content : "test comment"
/// created_at : "2021-08-28T15:20:12.000000Z"
/// updated_at : "2021-08-28T15:20:12.000000Z"
/// subject_class : "App\\Models\\Estate"

class Data {
  int? _id;
  int? _userId;
  int? _subjectId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  String? _subjectClass;

  int? get id => _id;
  int? get userId => _userId;
  int? get subjectId => _subjectId;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get subjectClass => _subjectClass;

  Data({
      int? id, 
      int? userId, 
      int? subjectId, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      String? subjectClass}){
    _id = id;
    _userId = userId;
    _subjectId = subjectId;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subjectClass = subjectClass;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _subjectId = json['subject_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _subjectClass = json['subject_class'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['subject_id'] = _subjectId;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['subject_class'] = _subjectClass;
    return map;
  }

}