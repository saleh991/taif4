

class DataOrderOffers {
  List<Data> ?data;
  int? code;
  bool? status;

  DataOrderOffers({this.data, this.code, this.status});

  DataOrderOffers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['status'] = this.status;
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
  String ?status;
  var rejectReason;
  String? district;

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
        this.district});

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
    return data;
  }
}
