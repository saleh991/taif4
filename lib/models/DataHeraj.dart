


class DataHeraj {
  bool? status;
  int? code;
  List<DataHerajModel>? data;

  DataHeraj({this.status, this.code, this.data});

  DataHeraj.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new DataHerajModel.fromJson(v));
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

class DataHerajModel {
  int? id;
  String? title;
  Category? category;
  String? message;
  String? createdAt;
  String? locationLat;
  String? locationLng;
  String? mainImage;
  List<Images>? images;
  List<dynamic>? media;
  List<Comments>? comments;
  User? user;

  DataHerajModel(
      {this.id,
        this.title,
        this.category,
        this.message,
        this.createdAt,
        this.locationLat,
        this.locationLng,
        this.mainImage,
        this.images,
        this.media,
        this.comments,
        this.user});

  DataHerajModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    message = json['message'];
    createdAt = json['created_at'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    mainImage = json['main_image'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['media'] != null) {
      // media = [];
      // json['media'].forEach((v) {
      //   media.add(new Null.fromJson(v));
      // });
    }
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['main_image'] = this.mainImage;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? parentId;

  Category({this.id, this.name, this.createdAt, this.updatedAt, this.parentId});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_id'] = this.parentId;
    return data;
  }
}

class Images {
  int? id;
  String ?path;
  String? viewableType;
  int? viewableId;
  String? createdAt;
  String ?updatedAt;

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

class Comments {
  int? id;
  int? userId;
  int? subjectId;
  String? content;
  String? createdAt;
  String? updatedAt;
  String ?subjectClass;

  Comments(
      {this.id,
        this.userId,
        this.subjectId,
        this.content,
        this.createdAt,
        this.updatedAt,
        this.subjectClass});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    subjectId = json['subject_id'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subjectClass = json['subject_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['subject_id'] = this.subjectId;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subject_class'] = this.subjectClass;
    return data;
  }
}

class User {
  int? id;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int ?packageId;
  String? start;
  String? end;
  int ?active;
  String ?image;
  String? code;
  var apiToken;
  String ?name;
  String? email;
  int? packageAds;
  int? packageComments;

  User(
      {this.id,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.packageId,
        this.start,
        this.end,
        this.active,
        this.image,
        this.code,
        this.apiToken,
        this.name,
        this.email,
        this.packageAds,
        this.packageComments});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    packageId = json['package_id'];
    start = json['start'];
    end = json['end'];
    active = json['active'];
    image = json['image'];
    code = json['code'];
    apiToken = json['api_token'];
    name = json['name'];
    email = json['email'];
    packageAds = json['package_ads'];
    packageComments = json['package_comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['package_id'] = this.packageId;
    data['start'] = this.start;
    data['end'] = this.end;
    data['active'] = this.active;
    data['image'] = this.image;
    data['code'] = this.code;
    data['api_token'] = this.apiToken;
    data['name'] = this.name;
    data['email'] = this.email;
    data['package_ads'] = this.packageAds;
    data['package_comments'] = this.packageComments;
    return data;
  }
}
