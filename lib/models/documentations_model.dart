/// data : [{"id":1,"name":"توثيق مبايعة ارض","documentation_category_id":1,"price":1000,"created_at":"2021-07-04T23:05:58.000000Z","updated_at":"2021-07-04T23:05:58.000000Z"}]
/// code : 200
/// status : true

class DocumentationsModel {
  List<Data>? _data;
  int? _code;
  bool? _status;

  List<Data>? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  DocumentationsModel({
      List<Data>? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  DocumentationsModel.fromJson(dynamic json) {
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
/// name : "توثيق مبايعة ارض"
/// documentation_category_id : 1
/// price : 1000
/// created_at : "2021-07-04T23:05:58.000000Z"
/// updated_at : "2021-07-04T23:05:58.000000Z"

class Data {
  int? _id;
  String? _name;
  int? _documentationCategoryId;
  int? _price;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  int? get documentationCategoryId => _documentationCategoryId;
  int? get price => _price;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Data({
      int? id, 
      String? name, 
      int? documentationCategoryId, 
      int? price, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _documentationCategoryId = documentationCategoryId;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _documentationCategoryId = json['documentation_category_id'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['documentation_category_id'] = _documentationCategoryId;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}