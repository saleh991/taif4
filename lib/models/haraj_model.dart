
/// data : [{"id":1,"user_id":4,"haraj_category_id":1,"title":"مرسيدس للبيع","message":"اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط ","created_at":"2021-08-11T06:47:27.000000Z","updated_at":"2021-08-22T20:46:03.000000Z","image":"harajs/-1628757911.png","location_lat":null,"location_lng":null,"views":5},{"id":2,"user_id":4,"haraj_category_id":2,"title":"أيفون للبيع جديد 12 برو ماكس","message":"أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس ","created_at":"2021-08-14T13:12:48.000000Z","updated_at":"2021-08-14T13:12:48.000000Z","image":"harajs/-1628946768.jpg","location_lat":null,"location_lng":null,"views":0}]
/// code : 200
/// status : true

// ignore_for_file: unnecessary_question_mark

class HarajModel
{
  List<Data>? _data;
  int? _code;
  bool? _status;

  List<Data>? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  HarajModel({
      List<Data>? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  HarajModel.fromJson(dynamic json) {
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
/// user_id : 4
/// haraj_category_id : 1
/// title : "مرسيدس للبيع"
/// message : "اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط "
/// created_at : "2021-08-11T06:47:27.000000Z"
/// updated_at : "2021-08-22T20:46:03.000000Z"
/// image : "harajs/-1628757911.png"
/// location_lat : null
/// location_lng : null
/// views : 5

class Data {
  int? id;
  double? km;
  User? user;
  Category? category;
  int? userId;
  int? harajCategoryId;
  String? title;
  String? message;
  String? createdAt;
  String? updatedAt;
  String? main_image;
  dynamic? locationLat;
  dynamic? locationLng;
  int? views;



  Data({
      this.id,
    this.userId,
    this.km,
    this.harajCategoryId,
    this.category,
    this.user,
    this.title,
    this.message,
    this.createdAt,
    this.updatedAt,
    this.main_image,
    this.locationLat,
    this.locationLng,
    this.views});

  Data.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    harajCategoryId = json['haraj_category_id'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    title = json['title'];
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    main_image = json['main_image'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    views = json['views'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['haraj_category_id'] = harajCategoryId;
    map['title'] = title;
    map['message'] = message;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['main_image'] = main_image;
    map['location_lat'] = locationLat;
    map['location_lng'] = locationLng;
    map['views'] = views;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

class User {
  int? _id;
  String? _phone;
  String? _createdAt;
  String? _updatedAt;
  int? _packageId;
  dynamic? _start;
  dynamic? _end;
  int? _active;
  dynamic? _image;
  String? _code;
  dynamic? _apiToken;
  String? _name;
  String? _email;
  int? _packageAds;
  int? _packageComments;

  int? get id => _id;
  String? get phone => _phone;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get packageId => _packageId;
  dynamic? get start => _start;
  dynamic? get end => _end;
  int? get active => _active;
  dynamic? get image => _image;
  String? get code => _code;
  dynamic? get apiToken => _apiToken;
  String? get name => _name;
  String? get email => _email;
  int? get packageAds => _packageAds;
  int? get packageComments => _packageComments;

  User({
    int? id,
    String? phone,
    String? createdAt,
    String? updatedAt,
    int? packageId,
    dynamic? start,
    dynamic? end,
    int? active,
    dynamic? image,
    String? code,
    dynamic? apiToken,
    String? name,
    String? email,
    int? packageAds,
    int? packageComments}){
    _id = id;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _packageId = packageId;
    _start = start;
    _end = end;
    _active = active;
    _image = image;
    _code = code;
    _apiToken = apiToken;
    _name = name;
    _email = email;
    _packageAds = packageAds;
    _packageComments = packageComments;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _packageId = json['package_id'];
    _start = json['start'];
    _end = json['end'];
    _active = json['active'];
    _image = json['image'];
    _code = json['code'];
    _apiToken = json['api_token'];
    _name = json['name'];
    _email = json['email'];
    _packageAds = json['package_ads'];
    _packageComments = json['package_comments'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['package_id'] = _packageId;
    map['start'] = _start;
    map['end'] = _end;
    map['active'] = _active;
    map['image'] = _image;
    map['code'] = _code;
    map['api_token'] = _apiToken;
    map['name'] = _name;
    map['email'] = _email;
    map['package_ads'] = _packageAds;
    map['package_comments'] = _packageComments;
    return map;
  }

}

class Category {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Category({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Category.fromJson(dynamic json) {
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