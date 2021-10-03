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
  int? id;
  int? sectionId;
  List<Images>? images;
      String? title;
  String? image;
  String? youtube;
  String? content;
  String? createdAt;
  int? views;
  dynamic? locationLng;
  dynamic? locationLat;
  double? km;
  String? updatedAt;



  Data({
     this.image,
    this.youtube,
    this.updatedAt,
    this.createdAt,
    this.title,
    this.id,
    this.content,
     this.images,
     this.sectionId,
    this.km,
    this.views,
    this.locationLat,
    this.locationLng


  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    sectionId = json['section_id'];
    title = json['title'];
    image = json['image'];
    youtube = json['youtube'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    views = json['views'];
    locationLng = json['location_lng'];
    locationLat = json['location_lat'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['section_id'] = sectionId;
    map['title'] = title;
    map['image'] = image;
    map['youtube'] = youtube;
    map['content'] = content;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;

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