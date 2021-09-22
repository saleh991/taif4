// ignore_for_file: deprecated_member_use

class FavoriteModel {
  bool? status;
  int? code;
  FavoriteData? data;

  FavoriteModel({this.status, this.code, this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data =
        json['data'] != null ? new FavoriteData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class FavoriteData {

  List<AppModelsEstate>? appModelsEstate;



  FavoriteData(
      {
      this.appModelsEstate});

  FavoriteData.fromJson(Map<String, dynamic> json) {

    if (json['estates'] != null) {
      appModelsEstate = <AppModelsEstate>[];
      json['estates'].forEach((v) {
        appModelsEstate!.add(new AppModelsEstate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.appModelsEstate != null) {
      data['estates'] =
          this.appModelsEstate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppModelsEstateOffer {
  int? id;
  FavoriteEstateRequest? favorite;

  AppModelsEstateOffer({this.id, this.favorite});

  AppModelsEstateOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    favorite = json['favorite'] != null
        ? new FavoriteEstateRequest.fromJson(json['favorite'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.favorite != null) {
      data['favorite'] = this.favorite!.toJson();
    }
    return data;
  }
}



class AppModelsEstate {
  int? id;
  FavoriteEstate? favorite;

  AppModelsEstate({this.id, this.favorite});

  AppModelsEstate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    favorite = json['favorite'] != null
        ? new FavoriteEstate.fromJson(json['favorite'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.favorite != null) {
      data['favorite'] = this.favorite!.toJson();
    }
    return data;
  }
}

class FavoriteEstateRequest {
  int? id;
  int? userId;
  String? type;
  String? purpose;
  int? area;
  int? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? showPhone;
  int? commentsEnabled;
  String? ownership;
  String? authType;
  String? authOption;
  int? sideId;
  String? image;
  String? title;
  Null locationLat;
  Null locationLng;
  int? views;

  FavoriteEstateRequest(
      {this.id,
      this.userId,
      this.type,
      this.purpose,
      this.area,
      this.price,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.showPhone,
      this.commentsEnabled,
      this.ownership,
      this.authType,
      this.authOption,
      this.sideId,
      this.image,
      this.title,
      this.locationLat,
      this.locationLng,
      this.views});

  FavoriteEstateRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    type = json['type'];
    purpose = json['purpose'];
    area = json['area'];
    price = json['price'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    showPhone = json['show_phone'];
    commentsEnabled = json['comments_enabled'];
    ownership = json['ownership'];
    authType = json['auth_type'];
    authOption = json['auth_option'];
    sideId = json['side_id'];
    image = json['image'];
    title = json['title'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    // data['purpose'] = this.purpose;
    data['area'] = this.area;
    data['price'] = this.price;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['show_phone'] = this.showPhone;
    data['comments_enabled'] = this.commentsEnabled;
    data['ownership'] = this.ownership;
    // data['auth_type'] = this.authType;
    data['auth_option'] = this.authOption;
    data['side_id'] = this.sideId;
    data['image'] = this.image;
    data['title'] = this.title;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['views'] = this.views;
    return data;
  }
}

class FavoritePost {
  int? id;
  int? tagId;
  String? image;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  String? youtube;
  int? views;
  Null locationLng;
  Null locationLat;
  String? phone;

  FavoritePost(
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
      this.phone});

  FavoritePost.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // data['tag_id'] = this.tagId;
    data['image'] = this.image;
    data['title'] = this.title;
    // data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // data['youtube'] = this.youtube;
    data['views'] = this.views;
    data['location_lng'] = this.locationLng;
    data['location_lat'] = this.locationLat;
    // data['phone'] = this.phone;
    return data;
  }
}

class FavoriteEstate {
  int? id;
  String? title;
  int? userId;
  String? area;
  int? price;
  String? type;
  String? description;
  int? showPhone;
  int? commentsEnabled;
  String? ownership;
  String? authOption;
  int? sideId;
  String? image;
  String? locationLat;
  String? locationLng;
  int? views;
  String? createdAt;
  String? updatedAt;
  int? streetWide;
  int? estateCategoryId;

  FavoriteEstate(
      {this.id,
      this.title,
      this.userId,
      this.area,
      this.price,
      this.type,
      this.description,
      this.showPhone,
      this.commentsEnabled,
      this.ownership,
      this.authOption,
      this.sideId,
      this.image,
      this.locationLat,
      this.locationLng,
      this.views,
      this.createdAt,
      this.updatedAt,
      this.streetWide,
      this.estateCategoryId});

  FavoriteEstate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['user_id'];
    area = json['area'];
    price = json['price'];
    type = json['type'];
    description = json['description'];
    showPhone = json['show_phone'];
    commentsEnabled = json['comments_enabled'];
    ownership = json['ownership'];
    authOption = json['auth_option'];
    sideId = json['side_id'];
    image = json['image'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    views = json['views'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    streetWide = json['street_wide'];
    estateCategoryId = json['estate_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['user_id'] = this.userId;
    data['area'] = this.area;
    data['price'] = this.price;
    data['type'] = this.type;
    data['description'] = this.description;
    data['show_phone'] = this.showPhone;
    data['comments_enabled'] = this.commentsEnabled;
    data['ownership'] = this.ownership;
    data['auth_option'] = this.authOption;
    data['side_id'] = this.sideId;
    data['image'] = this.image;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['views'] = this.views;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    // data['street_wide'] = this.streetWide;
    // data['estate_category_id'] = this.estateCategoryId;
    return data;
  }
}
