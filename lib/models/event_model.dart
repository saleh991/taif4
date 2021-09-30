/// data : [{"id":1,"section_id":1,"title":"العادية","image":"events/-1630236184.jfif","youtube":"https://opencart3.const-tech.biz/tf/admin/events/create","content":"des","created_at":"2021-08-29T11:23:04.000000Z","updated_at":"2021-08-29T11:23:04.000000Z"}]
/// code : 200
/// status : true

class EventModel {
  List<Data>? _data;
  int? _code;
  bool? _status;

  List<Data>? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  EventModel({
      List<Data>? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  EventModel.fromJson(dynamic json) {
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
/// section_id : 1
/// title : "العادية"
/// image : "events/-1630236184.jfif"
/// youtube : "https://opencart3.const-tech.biz/tf/admin/events/create"
/// content : "des"
/// created_at : "2021-08-29T11:23:04.000000Z"
/// updated_at : "2021-08-29T11:23:04.000000Z"

class Data {
  int? _id;
  int? _sectionId;
  List<Images>? _images;
      String? _title;
  String? _image;
  String? _youtube;
  String? _content;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get sectionId => _sectionId;
  List<Images>? get images => _images;

  String? get title => _title;
  String? get image => _image;
  String? get youtube => _youtube;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data({
      int? id, 
      int? sectionId, 
      String? title, 
      String? image, 
      String? youtube,
    List<Images>? images,
      String? content, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _sectionId = sectionId;
    _title = title;
    _image = image;
    _youtube = youtube;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _images=images;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sectionId = json['section_id'];
    _title = json['title'];
    _image = json['image'];
    _youtube = json['youtube'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['section_id'] = _sectionId;
    map['title'] = _title;
    map['image'] = _image;
    map['youtube'] = _youtube;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}


class Images {
  int? _id;
  String? _path;
  String? _viewableType;
  int? _viewableId;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get path => _path;
  String? get viewableType => _viewableType;
  int? get viewableId => _viewableId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Images({
    int? id,
    String? path,
    String? viewableType,
    int? viewableId,
    String? createdAt,
    String? updatedAt}){
    _id = id;
    _path = path;
    _viewableType = viewableType;
    _viewableId = viewableId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _path = json['path'];
    _viewableType = json['viewable_type'];
    _viewableId = json['viewable_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['path'] = _path;
    map['viewable_type'] = _viewableType;
    map['viewable_id'] = _viewableId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}