class DataOrderlocationServices {
  List<Data>? data;
  int ?code;
  bool ?status;

  DataOrderlocationServices({this.data, this.code, this.status});

  DataOrderlocationServices.fromJson(Map<String, dynamic> json) {
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
  int ?id;
  String? title;
  String? image;
  String ?content;
  String? createdAt;
  String? updatedAt;
  int? locationServiceCategoryId;
  String ?status;
  String? locationLat;
  String? locationLng;
  int? userId;
  String? phone;
  var rejectReason;
  int? views;
  String? district;
  Category? category;
  List<Images>? images;

  Data(
      {this.id,
        this.title,
        this.image,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.locationServiceCategoryId,
        this.status,
        this.locationLat,
        this.locationLng,
        this.userId,
        this.phone,
        this.rejectReason,
        this.views,
        this.district,
        this.category,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    locationServiceCategoryId = json['location_service_category_id'];
    status = json['status'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    userId = json['user_id'];
    phone = json['phone'];
    rejectReason = json['reject_reason'];
    views = json['views'];
    district = json['district'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    data['title'] = this.title;
    data['image'] = this.image;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['location_service_category_id'] = this.locationServiceCategoryId;
    data['status'] = this.status;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    data['reject_reason'] = this.rejectReason;
    data['views'] = this.views;
    data['district'] = this.district;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String ?createdAt;
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

class Images {
  int? id;
  String? path;
  String? viewableType;
  int? viewableId;
  String? createdAt;
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
