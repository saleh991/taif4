


// ignore_for_file: non_constant_identifier_names

class DataSingleOrderState {
  EstateData? data;
  int? code;
  bool? status;

  DataSingleOrderState({this.data, this.code, this.status});

  DataSingleOrderState.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new EstateData.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}

class EstateData {
  int? _id;
  int? old_years;
  int? mortgaged;
  String? _title;
  Category? _category;
  String? _type;
  String? _type_ar;
  String? district;
  String? _authOption;
  String? _ownership;
  String? _area;

  int? _streetWide;
  int? _price;
  String? _description;
  String? _createdAt;
  String? _locationLat;
  String? _locationLng;
  String? _mainImage;
  List<Images>? _images;
  List<dynamic>? _media;
  int? _views;
  List<Comments>? _comments;
  User? _user;
  Side? _side;
  int? _showPhone;
  int? _commentsEnabled;
  bool? twenty_four_hours_spend;

  int? get id => _id;
  String? get title => _title;
  Category? get category => _category;
  String? get type => _type;
  String? get type_ar => _type_ar;
  String? get authOption => _authOption;
  String? get ownership => _ownership;
  String? get area => _area;
  int? get streetWide => _streetWide;
  int? get price => _price;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get locationLat => _locationLat;
  String? get locationLng => _locationLng;
  String? get mainImage => _mainImage;
  List<Images>? get images => _images;
  List<dynamic>? get media => _media;
  int? get views => _views;
  List<Comments>? get comments => _comments;
  User? get user => _user;
  Side? get side => _side;
  int? get showPhone => _showPhone;
  int? get commentsEnabled => _commentsEnabled;

  EstateData({
    int? mortgaged,
    int? id,
    int? old_years,
    String? title,
    Category? category,
    String? type,
    String? authOption,
    String? ownership,
    String? area,
    int? streetWide,
    int? price,
    bool? twenty_four_hours_spend,
    String? description,
    String? createdAt,
    String? type_ar,
    String? district,
    String? locationLat,
    String? locationLng,
    String? mainImage,
    List<Images>? images,
    List<dynamic>? media,
    int? views,
    List<Comments>? comments,
    User? user,
    Side? side,
    int? showPhone,
    int? commentsEnabled}){
    _id = id;
    _title = title;
    _category = category;
    _type = type;
    _type_ar = type_ar;
    _authOption = authOption;
    _ownership = ownership;
    _area = area;
    _streetWide = streetWide;
    _price = price;
    _description = description;
    _createdAt = createdAt;
    _locationLat = locationLat;
    _locationLng = locationLng;
    _mainImage = mainImage;
    _images = images;
    _media = media;
    _views = views;
    _comments = comments;
    _user = user;
    _side = side;
    _showPhone = showPhone;
    _commentsEnabled = commentsEnabled;
  }

  EstateData.fromJson(dynamic json) {
    twenty_four_hours_spend = json['twenty_four_hours_spend'];
    old_years = json['old_years'];
    mortgaged = json['mortgaged'];
    _id = json['id'];
    _title = json['title'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _type = json['type'];
    _type_ar = json['type_ar'];
    district = json['district'];
    _authOption = json['auth_option'];
    _ownership = json['ownership'];
    _area = json['area'];
    _streetWide = json['street_wide'];
    _price = json['price'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _locationLat = json['location_lat'];
    _locationLng = json['location_lng'];
    _mainImage = json['main_image'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    // if (json['media'] != null) {
    //   _media = [];
    //   json['media'].forEach((v) {
    //     _media?.add(dynamic.fromJson(v));
    //   });
    // }
    _views = json['views'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _side = json['side'] != null ? Side.fromJson(json['side']) : null;
    _showPhone = json['show_phone'];
    _commentsEnabled = json['comments_enabled'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['type'] = _type;
    map['auth_option'] = _authOption;
    map['ownership'] = _ownership;
    map['area'] = _area;
    map['street_wide'] = _streetWide;
    map['price'] = _price;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['location_lat'] = _locationLat;
    map['location_lng'] = _locationLng;
    map['main_image'] = _mainImage;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    map['views'] = _views;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_side != null) {
      map['side'] = _side?.toJson();
    }
    map['show_phone'] = _showPhone;
    map['comments_enabled'] = _commentsEnabled;
    return map;
  }

}

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Category({this.id, this.name, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



class Side {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Side({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Side.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
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

class User {
  int? id;
  String? phone;
  String? createdAt;
  String ?updatedAt;
  int? packageId;
  var start;
  var end;
  var active;
  String? image;
  String? code;
  var apiToken;
  String? name;
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


class Comments {
  int? _id;
  User? _user;
  int? _subjectId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  String? _subjectClass;

  int? get id => _id;
  User? get user => _user;
  int? get subjectId => _subjectId;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get subjectClass => _subjectClass;

  Comments({
    int? id,
    User? user,
    int? subjectId,
    String? content,
    String? createdAt,
    String? updatedAt,
    String? subjectClass}){
    _id = id;
    _user = user;
    _subjectId = subjectId;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subjectClass = subjectClass;
  }

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _subjectId = json['subject_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _subjectClass = json['subject_class'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;

    map['subject_id'] = _subjectId;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['subject_class'] = _subjectClass;
    return map;
  }

}