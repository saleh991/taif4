/// status : true
/// code : 200
/// data : {"main":[{"name":"estates","categories":[{"id":1,"name":"عروض عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"},{"id":2,"name":"طلبات عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"}],"models":["App\\Models\\EstateRequest","App\\Models\\EstateOffer"],"types":{"villa":"فيلا","land":"ارض","building":"عمارة","folk_house":"بيت شعبي","chalet":"استراحة","ownership Apartment":"شقة تمليك","ownership_floor":"دور تمليك","farm":"مزرعة"}},{"name":"location_services","model":"App\\Models\\LocationService","categories":[{"id":1,"name":"شاليهات","created_at":"2021-07-04T16:15:48.000000Z","updated_at":"2021-07-06T01:29:44.000000Z"},{"id":2,"name":"منتجعات","created_at":"2021-07-06T01:29:54.000000Z","updated_at":"2021-07-06T01:29:54.000000Z"},{"id":3,"name":"مطاعم","created_at":"2021-07-06T01:30:05.000000Z","updated_at":"2021-07-06T01:30:05.000000Z"},{"id":4,"name":"مقاهي","created_at":"2021-07-06T01:30:13.000000Z","updated_at":"2021-07-06T01:30:13.000000Z"},{"id":5,"name":"ملاهي","created_at":"2021-07-06T01:30:24.000000Z","updated_at":"2021-07-06T01:30:24.000000Z"}]},{"name":"home_services","model":"App\\Models\\HomeService","categories":[{"id":1,"name":"الكهرباء","created_at":"2021-07-04T14:05:59.000000Z","updated_at":"2021-07-04T14:05:59.000000Z"},{"id":2,"name":"سباكة","created_at":"2021-07-04T14:06:11.000000Z","updated_at":"2021-07-04T14:06:11.000000Z"},{"id":3,"name":"فني تبريد","created_at":"2021-07-06T01:28:50.000000Z","updated_at":"2021-07-06T01:28:50.000000Z"},{"id":4,"name":"فني تكييف","created_at":"2021-07-06T01:29:02.000000Z","updated_at":"2021-07-06T01:29:02.000000Z"},{"id":5,"name":"نظافة","created_at":"2021-07-06T01:29:10.000000Z","updated_at":"2021-07-06T01:29:10.000000Z"}]},{"name":"harajs","model":"App\\Models\\Haraj","categories":[{"id":1,"name":"سيارت","created_at":"2021-07-04T18:17:36.000000Z","updated_at":"2021-07-04T18:17:48.000000Z"},{"id":2,"name":"أجهزة","created_at":"2021-07-06T01:31:07.000000Z","updated_at":"2021-07-06T01:31:07.000000Z"},{"id":3,"name":"مواشي","created_at":"2021-07-06T01:31:13.000000Z","updated_at":"2021-07-06T01:31:13.000000Z"},{"id":4,"name":"طيور","created_at":"2021-07-06T01:31:25.000000Z","updated_at":"2021-07-06T01:31:25.000000Z"},{"id":5,"name":"أثاث","created_at":"2021-07-06T01:31:33.000000Z","updated_at":"2021-07-06T01:31:33.000000Z"}]}]}

class MapModel {
  bool? _status;
  int? _code;
  Data? _data;

  bool? get status => _status;
  int? get code => _code;
  Data? get data => _data;

  MapModel({
      bool? status, 
      int? code, 
      Data? data}){
    _status = status;
    _code = code;
    _data = data;
}

  MapModel.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// main : [{"name":"estates","categories":[{"id":1,"name":"عروض عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"},{"id":2,"name":"طلبات عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"}],"models":["App\\Models\\EstateRequest","App\\Models\\EstateOffer"],"types":{"villa":"فيلا","land":"ارض","building":"عمارة","folk_house":"بيت شعبي","chalet":"استراحة","ownership Apartment":"شقة تمليك","ownership_floor":"دور تمليك","farm":"مزرعة"}},{"name":"location_services","model":"App\\Models\\LocationService","categories":[{"id":1,"name":"شاليهات","created_at":"2021-07-04T16:15:48.000000Z","updated_at":"2021-07-06T01:29:44.000000Z"},{"id":2,"name":"منتجعات","created_at":"2021-07-06T01:29:54.000000Z","updated_at":"2021-07-06T01:29:54.000000Z"},{"id":3,"name":"مطاعم","created_at":"2021-07-06T01:30:05.000000Z","updated_at":"2021-07-06T01:30:05.000000Z"},{"id":4,"name":"مقاهي","created_at":"2021-07-06T01:30:13.000000Z","updated_at":"2021-07-06T01:30:13.000000Z"},{"id":5,"name":"ملاهي","created_at":"2021-07-06T01:30:24.000000Z","updated_at":"2021-07-06T01:30:24.000000Z"}]},{"name":"home_services","model":"App\\Models\\HomeService","categories":[{"id":1,"name":"الكهرباء","created_at":"2021-07-04T14:05:59.000000Z","updated_at":"2021-07-04T14:05:59.000000Z"},{"id":2,"name":"سباكة","created_at":"2021-07-04T14:06:11.000000Z","updated_at":"2021-07-04T14:06:11.000000Z"},{"id":3,"name":"فني تبريد","created_at":"2021-07-06T01:28:50.000000Z","updated_at":"2021-07-06T01:28:50.000000Z"},{"id":4,"name":"فني تكييف","created_at":"2021-07-06T01:29:02.000000Z","updated_at":"2021-07-06T01:29:02.000000Z"},{"id":5,"name":"نظافة","created_at":"2021-07-06T01:29:10.000000Z","updated_at":"2021-07-06T01:29:10.000000Z"}]},{"name":"harajs","model":"App\\Models\\Haraj","categories":[{"id":1,"name":"سيارت","created_at":"2021-07-04T18:17:36.000000Z","updated_at":"2021-07-04T18:17:48.000000Z"},{"id":2,"name":"أجهزة","created_at":"2021-07-06T01:31:07.000000Z","updated_at":"2021-07-06T01:31:07.000000Z"},{"id":3,"name":"مواشي","created_at":"2021-07-06T01:31:13.000000Z","updated_at":"2021-07-06T01:31:13.000000Z"},{"id":4,"name":"طيور","created_at":"2021-07-06T01:31:25.000000Z","updated_at":"2021-07-06T01:31:25.000000Z"},{"id":5,"name":"أثاث","created_at":"2021-07-06T01:31:33.000000Z","updated_at":"2021-07-06T01:31:33.000000Z"}]}]

class Data {
  List<Main>? _main;

  List<Main>? get main => _main;

  Data({
      List<Main>? main}){
    _main = main;
}

  Data.fromJson(dynamic json) {
    if (json['main'] != null) {
      _main = [];
      json['main'].forEach((v) {
        _main?.add(Main.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_main != null) {
      map['main'] = _main?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "estates"
/// categories : [{"id":1,"name":"عروض عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"},{"id":2,"name":"طلبات عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"}]
/// models : ["App\\Models\\EstateRequest","App\\Models\\EstateOffer"]
/// types : {"villa":"فيلا","land":"ارض","building":"عمارة","folk_house":"بيت شعبي","chalet":"استراحة","ownership Apartment":"شقة تمليك","ownership_floor":"دور تمليك","farm":"مزرعة"}

class Main {
  String? _name;
  List<Categories>? _categories;
  List<String>? _models;
  Types? _types;

  String? get name => _name;
  List<Categories>? get categories => _categories;
  List<String>? get models => _models;
  Types? get types => _types;

  Main({
      String? name, 
      List<Categories>? categories, 
      List<String>? models, 
      Types? types}){
    _name = name;
    _categories = categories;
    _models = models;
    _types = types;
}

  Main.fromJson(dynamic json) {
    _name = json['name'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _models = json['models'] != null ? json['models'].cast<String>() : [];
    _types = json['types'] != null ? Types.fromJson(json['types']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['models'] = _models;
    if (_types != null) {
      map['types'] = _types?.toJson();
    }
    return map;
  }

}

/// villa : "فيلا"
/// land : "ارض"
/// building : "عمارة"
/// folk_house : "بيت شعبي"
/// chalet : "استراحة"
/// ownership Apartment : "شقة تمليك"
/// ownership_floor : "دور تمليك"
/// farm : "مزرعة"

class Types {
  String? _villa;
  String? _land;
  String? _building;
  String? _folkHouse;
  String? _chalet;
  String? _ownershipApartment;
  String? _ownershipFloor;
  String? _farm;

  String? get villa => _villa;
  String? get land => _land;
  String? get building => _building;
  String? get folkHouse => _folkHouse;
  String? get chalet => _chalet;
  String? get ownershipApartment => _ownershipApartment;
  String? get ownershipFloor => _ownershipFloor;
  String? get farm => _farm;

  Types({
      String? villa, 
      String? land, 
      String? building, 
      String? folkHouse, 
      String? chalet, 
      String? ownershipApartment,
      String? ownershipFloor, 
      String? farm}){
    _villa = villa;
    _land = land;
    _building = building;
    _folkHouse = folkHouse;
    _chalet = chalet;
    _ownershipApartment = ownershipApartment;
    _ownershipFloor = ownershipFloor;
    _farm = farm;
}

  Types.fromJson(dynamic json) {
    _villa = json['villa'];
    _land = json['land'];
    _building = json['building'];
    _folkHouse = json['folk_house'];
    _chalet = json['chalet'];
    _ownershipApartment = json['ownership Apartment'];
    _ownershipFloor = json['ownership_floor'];
    _farm = json['farm'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['villa'] = _villa;
    map['land'] = _land;
    map['building'] = _building;
    map['folk_house'] = _folkHouse;
    map['chalet'] = _chalet;
    map['ownership Apartment'] = _ownershipApartment;
    map['ownership_floor'] = _ownershipFloor;
    map['farm'] = _farm;
    return map;
  }

}

/// id : 1
/// name : "عروض عقارية"
/// created_at : "2021-09-01T19:13:22.000000Z"
/// updated_at : "2021-09-01T19:13:22.000000Z"

class Categories {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Categories({
      int? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Categories.fromJson(dynamic json) {
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