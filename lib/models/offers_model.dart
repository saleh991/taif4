



class OffersModel {
  bool? status;
  int? code;
  List<Data>? data;

  OffersModel({this.status, this.code, this.data});

  OffersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? tagId;
  String? image;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  var youtube;
  int? views;
  String? locationLng;
  String? locationLat;
  String? phone;
  int? userId;
  var refresh;
  int? commentsEnabled;
  String? status;
  var rejectReason;
  String? district;
  List<Images>? images;

  Data(
      {this.id,
        this.tagId,
        this.image,
        this.title,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.youtube,
        this.views,
        this.locationLng,
        this.locationLat,
        this.phone,
        this.userId,
        this.refresh,
        this.commentsEnabled,
        this.status,
        this.rejectReason,
        this.district,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagId = json['tag_id'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    youtube = json['youtube'];
    views = json['views'];
    locationLng = json['location_lng'];
    locationLat = json['location_lat'];
    phone = json['phone'];
    userId = json['user_id'];
    refresh = json['refresh'];
    commentsEnabled = json['comments_enabled'];
    status = json['status'];
    rejectReason = json['reject_reason'];
    district = json['district'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag_id'] = this.tagId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['youtube'] = this.youtube;
    data['views'] = this.views;
    data['location_lng'] = this.locationLng;
    data['location_lat'] = this.locationLat;
    data['phone'] = this.phone;
    data['user_id'] = this.userId;
    data['refresh'] = this.refresh;
    data['comments_enabled'] = this.commentsEnabled;
    data['status'] = this.status;
    data['reject_reason'] = this.rejectReason;
    data['district'] = this.district;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? path;
  String? viewableType;
  int? viewableId;
  String ?createdAt;
  String? updatedAt;

  Images(
      {this.id,
        this.path,
        this.viewableType,
        this.viewableId,
        this.createdAt,
        this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    viewableType = json['viewable_type'];
    viewableId = json['viewable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['viewable_type'] = this.viewableType;
    data['viewable_id'] = this.viewableId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



//
// class OffersModel {
//   bool? _status;
//   int? _code;
//   List<Data>? _data;
//
//   bool? get status => _status;
//   int? get code => _code;
//   List<Data>? get data => _data;
//
//   OffersModel({
//       bool? status,
//       int? code,
//       List<Data>? data}){
//     _status = status;
//     _code = code;
//     _data = data;
// }
//
//   OffersModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _code = json['code'];
//     if (json['data'] != null) {
//       _data = [];
//       json['data'].forEach((v) {
//         _data?.add(Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['status'] = _status;
//     map['code'] = _code;
//     if (_data != null) {
//       map['data'] = _data?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Data {
//   int? id;
//   double? km;
//   int? tagId;
//   String? image;
//   String? title;
//   String? content;
//   String? createdAt;
//   String? updatedAt;
//   dynamic? youtube;
//   int? views;
//   dynamic? locationLng;
//   dynamic? locationLat;
//   dynamic? phone;
//   List<Images>? images;
//
//
//   Data({
//       this.locationLng,
//   this.locationLat,
//   this.views,
//   this.content,
//   this.id,
//     this.title,
//     this.createdAt,
//     this.updatedAt,
//     this.youtube,
//     this.image,
//     this.tagId,
//     this.phone,
//     this.images,
//     this.km
//
//
//   });
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     tagId = json['tag_id'];
//     image = json['image'];
//     title = json['title'];
//     content = json['content'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     youtube = json['youtube'];
//     views = json['views'];
//     locationLng = json['location_lng'];
//     locationLat = json['location_lat'];
//     phone = json['phone'];
//     if (json['images'] != null) {
//       images = [];
//       json['images'].forEach((v) {
//         images?.add(v.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['id'] = id;
//     map['tag_id'] = tagId;
//     map['image'] = image;
//     map['title'] = title;
//     map['content'] = content;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['youtube'] = youtube;
//     map['views'] = views;
//     map['location_lng'] = locationLng;
//     map['location_lat'] = locationLat;
//     map['phone'] = phone;
//     if (images != null) {
//       map['images'] = images?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class Images {
//   int? _id;
//   String? _path;
//   String? _viewableType;
//   int? _viewableId;
//   String? _createdAt;
//   String? _updatedAt;
//
//   int? get id => _id;
//   String? get path => _path;
//   String? get viewableType => _viewableType;
//   int? get viewableId => _viewableId;
//   String? get createdAt => _createdAt;
//   String? get updatedAt => _updatedAt;
//
//   Images({
//     int? id,
//     String? path,
//     String? viewableType,
//     int? viewableId,
//     String? createdAt,
//     String? updatedAt}){
//     _id = id;
//     _path = path;
//     _viewableType = viewableType;
//     _viewableId = viewableId;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//   }
//
//   Images.fromJson(dynamic json) {
//     _id = json['id'];
//     _path = json['path'];
//     _viewableType = json['viewable_type'];
//     _viewableId = json['viewable_id'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['id'] = _id;
//     map['path'] = _path;
//     map['viewable_type'] = _viewableType;
//     map['viewable_id'] = _viewableId;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
//
// }