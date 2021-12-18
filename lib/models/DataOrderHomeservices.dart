

class DataOrderHomeservices {
  List<Data>? data;
  int? code;
  bool? status;

  DataOrderHomeservices({this.data, this.code, this.status});

  DataOrderHomeservices.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phone;
  String? neighborhoods;
  String? createdAt;
  String? updatedAt;
  int? homeServiceCategoryId;
  int ?views;
  String? district;
  int? userId;
  int ?commentsEnabled;
  String ?locationLat;
  String? locationLng;
  String? status;
  String? rejectReason;
  Category? category;

  Data(
      {this.id,
        this.name,
        this.phone,
        this.neighborhoods,
        this.createdAt,
        this.updatedAt,
        this.homeServiceCategoryId,
        this.views,
        this.district,
        this.userId,
        this.commentsEnabled,
        this.locationLat,
        this.locationLng,
        this.status,
        this.category,
        this.rejectReason});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    phone = json['phone'];
    neighborhoods = json['neighborhoods'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeServiceCategoryId = json['home_service_category_id'];
    views = json['views'];
    district = json['district'];
    userId = json['user_id'];
    commentsEnabled = json['comments_enabled'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    status = json['status'];
    rejectReason = json['reject_reason'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['neighborhoods'] = this.neighborhoods;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['home_service_category_id'] = this.homeServiceCategoryId;
    data['views'] = this.views;
    data['district'] = this.district;
    data['user_id'] = this.userId;
    data['comments_enabled'] = this.commentsEnabled;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['status'] = this.status;
    data['reject_reason'] = this.rejectReason;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? icon;

  Category({this.id, this.name, this.createdAt, this.updatedAt, this.icon});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon'] = this.icon;
    return data;
  }
}
