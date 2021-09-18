
/// data : [{"id":1,"user_id":4,"haraj_category_id":1,"title":"مرسيدس للبيع","message":"اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط اعلان تجربة فقط ","created_at":"2021-08-11T06:47:27.000000Z","updated_at":"2021-08-22T20:46:03.000000Z","image":"harajs/-1628757911.png","location_lat":null,"location_lng":null,"views":5},{"id":2,"user_id":4,"haraj_category_id":2,"title":"أيفون للبيع جديد 12 برو ماكس","message":"أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس أيفون للبيع جديد 12 برو ماكس ","created_at":"2021-08-14T13:12:48.000000Z","updated_at":"2021-08-14T13:12:48.000000Z","image":"harajs/-1628946768.jpg","location_lat":null,"location_lng":null,"views":0}]
/// code : 200
/// status : true

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
  int? _id;
  int? _userId;
  int? _harajCategoryId;
  String? _title;
  String? _message;
  String? _createdAt;
  String? _updatedAt;
  String? _main_image;
  dynamic? _locationLat;
  dynamic? _locationLng;
  int? _views;

  int? get id => _id;
  int? get userId => _userId;
  int? get harajCategoryId => _harajCategoryId;
  String? get title => _title;
  String? get message => _message;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get main_image => _main_image;
  dynamic? get locationLat => _locationLat;
  dynamic? get locationLng => _locationLng;
  int? get views => _views;

  Data({
      int? id, 
      int? userId, 
      int? harajCategoryId, 
      String? title, 
      String? message, 
      String? createdAt, 
      String? updatedAt, 
      String? main_image,
      dynamic? locationLat, 
      dynamic? locationLng, 
      int? views}){
    _id = id;
    _userId = userId;
    _harajCategoryId = harajCategoryId;
    _title = title;
    _message = message;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _main_image = main_image;
    _locationLat = locationLat;
    _locationLng = locationLng;
    _views = views;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _harajCategoryId = json['haraj_category_id'];
    _title = json['title'];
    _message = json['message'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _main_image = json['main_image'];
    _locationLat = json['location_lat'];
    _locationLng = json['location_lng'];
    _views = json['views'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['haraj_category_id'] = _harajCategoryId;
    map['title'] = _title;
    map['message'] = _message;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['main_image'] = _main_image;
    map['location_lat'] = _locationLat;
    map['location_lng'] = _locationLng;
    map['views'] = _views;
    return map;
  }

}