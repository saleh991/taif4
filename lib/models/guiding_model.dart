class GuidingModel {
  bool? status;
  int? code;
  List<Data>? data;

  GuidingModel({this.status, this.code, this.data});

  GuidingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  String? title;
  Guide? guide;
  String? phone;
  String? content;
  String ?createdAt;
  String ?image;
  List<Images>? images;



  Data(
      {this.id,
        this.title,
        this.guide,
        this.content,
        this.createdAt,
        this.image,
        this.images,
        this.phone

    });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    guide = json['guide'] != null
        ? new Guide.fromJson(json['guide'])
        : null;
    phone = json['phone'];
    content = json['content'];
    createdAt = json['created_at'];
    image = json['image'];
    if (json['images'] != null) {
      images =  <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.guide != null) {
      data['guide'] = this.guide!.toJson();
    }
    data['phone'] = this.phone;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['image'] = this.image;



    return data;
  }
}

class Guide {

  int? id;
  int? experience_years;
  String? name;
  String? phone;
  String? createdAt;
  String? notes;
  String? status;
  String? updatedAt;


  Guide({this.id, this.name, this.createdAt, this.updatedAt,
    this.phone,this.status,
    this.experience_years,
    this.notes
  });

  Guide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    experience_years = json['experience_years'];
    phone = json['phone'];
    status = json['status'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['experience_years'] = this.experience_years;
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

