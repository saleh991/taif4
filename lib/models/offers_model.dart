/// status : true
/// code : 200
/// data : [{"id":3,"tag_id":3,"image":"posts/4-1629520033.jpg","title":"خصم خاص","content":"تعد طريقة عرض المنتجات في المحلات من أهم وسائل التسويق للمنتجات، حيث أن طريقة العرض المنظمة أمر في غاية الأهمية لأن العرض المميز هو أحد أهم العوامل الجاذبة للمتسوقين.","created_at":"2021-07-02T06:09:01.000000Z","updated_at":"2021-08-27T08:43:14.000000Z","youtube":null,"views":13,"location_lng":null,"location_lat":null,"phone":null,"images":[]},{"id":10,"tag_id":3,"image":"posts/4-1629520193.jpg","title":"عروض خاصة للمتاجر","content":"تعد طريقة عرض المنتجات في المحلات من أهم وسائل التسويق للمنتجات، حيث أن طريقة العرض المنظمة أمر في غاية الأهمية لأن العرض المميز هو أحد أهم العوامل الجاذبة للمتسوقين.","created_at":"2021-07-02T06:09:01.000000Z","updated_at":"2021-09-06T06:29:10.000000Z","youtube":null,"views":19,"location_lng":null,"location_lat":null,"phone":null,"images":[]},{"id":11,"tag_id":3,"image":"posts/4-1629520137.jpg","title":"عرض خاص للفحص","content":"تعد طريقة عرض المنتجات في المحلات من أهم وسائل التسويق للمنتجات، حيث أن طريقة العرض المنظمة أمر في غاية الأهمية لأن العرض المميز هو أحد أهم العوامل الجاذبة للمتسوقين.","created_at":"2021-07-02T06:09:01.000000Z","updated_at":"2021-09-06T06:29:09.000000Z","youtube":null,"views":11,"location_lng":null,"location_lat":null,"phone":null,"images":[]},{"id":12,"tag_id":3,"image":"posts/4-1629520093.jpg","title":"بطاقة خصومات","content":"تعد طريقة عرض المنتجات في المحلات من أهم وسائل التسويق للمنتجات، حيث أن طريقة العرض المنظمة أمر في غاية الأهمية لأن العرض المميز هو أحد أهم العوامل الجاذبة للمتسوقين.","created_at":"2021-07-02T06:09:01.000000Z","updated_at":"2021-09-04T15:05:11.000000Z","youtube":null,"views":9,"location_lng":null,"location_lat":null,"phone":null,"images":[]}]

class OffersModel {
  bool? _status;
  int? _code;
  List<Data>? _data;

  bool? get status => _status;
  int? get code => _code;
  List<Data>? get data => _data;

  OffersModel({
      bool? status, 
      int? code, 
      List<Data>? data}){
    _status = status;
    _code = code;
    _data = data;
}

  OffersModel.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// tag_id : 3
/// image : "posts/4-1629520033.jpg"
/// title : "خصم خاص"
/// content : "تعد طريقة عرض المنتجات في المحلات من أهم وسائل التسويق للمنتجات، حيث أن طريقة العرض المنظمة أمر في غاية الأهمية لأن العرض المميز هو أحد أهم العوامل الجاذبة للمتسوقين."
/// created_at : "2021-07-02T06:09:01.000000Z"
/// updated_at : "2021-08-27T08:43:14.000000Z"
/// youtube : null
/// views : 13
/// location_lng : null
/// location_lat : null
/// phone : null
/// images : []

class Data {
  int? _id;
  int? _tagId;
  String? _image;
  String? _title;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  dynamic? _youtube;
  int? _views;
  dynamic? _locationLng;
  dynamic? _locationLat;
  dynamic? _phone;
  List<dynamic>? _images;

  int? get id => _id;
  int? get tagId => _tagId;
  String? get image => _image;
  String? get title => _title;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic? get youtube => _youtube;
  int? get views => _views;
  dynamic? get locationLng => _locationLng;
  dynamic? get locationLat => _locationLat;
  dynamic? get phone => _phone;
  List<dynamic>? get images => _images;

  Data({
      int? id, 
      int? tagId, 
      String? image, 
      String? title, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      dynamic? youtube, 
      int? views, 
      dynamic? locationLng, 
      dynamic? locationLat, 
      dynamic? phone, 
      List<String>? images}){
    _id = id;
    _tagId = tagId;
    _image = image;
    _title = title;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _youtube = youtube;
    _views = views;
    _locationLng = locationLng;
    _locationLat = locationLat;
    _phone = phone;
    _images = images;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _tagId = json['tag_id'];
    _image = json['image'];
    _title = json['title'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _youtube = json['youtube'];
    _views = json['views'];
    _locationLng = json['location_lng'];
    _locationLat = json['location_lat'];
    _phone = json['phone'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(v.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['tag_id'] = _tagId;
    map['image'] = _image;
    map['title'] = _title;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['youtube'] = _youtube;
    map['views'] = _views;
    map['location_lng'] = _locationLng;
    map['location_lat'] = _locationLat;
    map['phone'] = _phone;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}