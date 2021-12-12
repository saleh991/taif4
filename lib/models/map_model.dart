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









//
// class MapModel {
//   bool? status;
//   int ?code;
//   Data? data;
//
//   MapModel({this.status, this.code, this.data});
//
//   MapModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     code = json['code'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['code'] = this.code;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<Main>? main;
//
//   Data({this.main});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['main'] != null) {
//       main = [];
//       json['main'].forEach((v) {
//         main!.add(new Main.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.main != null) {
//       data['main'] = this.main!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Main {
//   String ?name;
//   List<Categories>? categories;
//   String? model;
//   Types? types;
//
//   Main({this.name, this.categories, this.model, this.types});
//
//   Main.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     if (json['categories'] != null) {
//       categories = [];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     model = json['model'];
//     types = json['types'] != null ? new Types.fromJson(json['types']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     data['model'] = this.model;
//     if (this.types != null) {
//       data['types'] = this.types!.toJson();
//     }
//     return data;
//   }
// }
//
// class Categories {
//   int? id;
//   String? name;
//   String? createdAt;
//   String? updatedAt;
//   String? icon;
//
//   Categories({this.id, this.name, this.createdAt, this.updatedAt, this.icon});
//
//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     icon = json['icon']??"";
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['icon'] = this.icon;
//     return data;
//   }
// }
//
// class Types {
//   String? byaaFyla;
//   String? byaaArd;
//   String? byaaAamar;
//   String? byaaBytShaaby;
//   String? byaaAstrah;
//   String? byaaShkTmlyk;
//   String? byaaDorTmlyk;
//   String? byaaMzraa;
//   String? byaaAkhr;
//   String? aygarFyla;
//   String? aygarArd;
//   String? aygarAamar;
//   String? aygarBytShaaby;
//   String? aygarAstrah;
//   String? aygarShkTmlyk;
//   String? aygarDorTmlyk;
//   String ?aygarMzraa;
//   String? aygarAkhr;
//   String? astthmarFyla;
//   String? astthmarArd;
//   String? astthmarAamar;
//   String? astthmarBytShaaby;
//   String? astthmarAstrah;
//   String? astthmarShkTmlyk;
//   String? astthmarDorTmlyk;
//   String? astthmarMzraa;
//   String? astthmarAkhr;
//   String? shraaaFyla;
//   String? shraaaArd;
//   String? shraaaAamar;
//   String? shraaaBytShaaby;
//   String ?shraaaAstrah;
//   String? shraaaShkTmlyk;
//   String ?shraaaDorTmlyk;
//   String? shraaaMzraa;
//   String? shraaaAkhr;
//   String? astygarFyla;
//   String? astygarArd;
//   String? astygarAamar;
//   String? astygarBytShaaby;
//   String? astygarAstrah;
//   String? astygarShkTmlyk;
//   String? astygarDorTmlyk;
//   String? astygarMzraa;
//   String? astygarAkhr;
//
//   Types(
//       {this.byaaFyla,
//         this.byaaArd,
//         this.byaaAamar,
//         this.byaaBytShaaby,
//         this.byaaAstrah,
//         this.byaaShkTmlyk,
//         this.byaaDorTmlyk,
//         this.byaaMzraa,
//         this.byaaAkhr,
//         this.aygarFyla,
//         this.aygarArd,
//         this.aygarAamar,
//         this.aygarBytShaaby,
//         this.aygarAstrah,
//         this.aygarShkTmlyk,
//         this.aygarDorTmlyk,
//         this.aygarMzraa,
//         this.aygarAkhr,
//         this.astthmarFyla,
//         this.astthmarArd,
//         this.astthmarAamar,
//         this.astthmarBytShaaby,
//         this.astthmarAstrah,
//         this.astthmarShkTmlyk,
//         this.astthmarDorTmlyk,
//         this.astthmarMzraa,
//         this.astthmarAkhr,
//         this.shraaaFyla,
//         this.shraaaArd,
//         this.shraaaAamar,
//         this.shraaaBytShaaby,
//         this.shraaaAstrah,
//         this.shraaaShkTmlyk,
//         this.shraaaDorTmlyk,
//         this.shraaaMzraa,
//         this.shraaaAkhr,
//         this.astygarFyla,
//         this.astygarArd,
//         this.astygarAamar,
//         this.astygarBytShaaby,
//         this.astygarAstrah,
//         this.astygarShkTmlyk,
//         this.astygarDorTmlyk,
//         this.astygarMzraa,
//         this.astygarAkhr});
//
//   Types.fromJson(Map<String, dynamic> json) {
//     byaaFyla = json['byaa-fyla'];
//     byaaArd = json['byaa-ard'];
//     byaaAamar = json['byaa-aamar'];
//     byaaBytShaaby = json['byaa-byt-shaaby'];
//     byaaAstrah = json['byaa-astrah'];
//     byaaShkTmlyk = json['byaa-shk-tmlyk'];
//     byaaDorTmlyk = json['byaa-dor-tmlyk'];
//     byaaMzraa = json['byaa-mzraa'];
//     byaaAkhr = json['byaa-akhr'];
//     aygarFyla = json['aygar-fyla'];
//     aygarArd = json['aygar-ard'];
//     aygarAamar = json['aygar-aamar'];
//     aygarBytShaaby = json['aygar-byt-shaaby'];
//     aygarAstrah = json['aygar-astrah'];
//     aygarShkTmlyk = json['aygar-shk-tmlyk'];
//     aygarDorTmlyk = json['aygar-dor-tmlyk'];
//     aygarMzraa = json['aygar-mzraa'];
//     aygarAkhr = json['aygar-akhr'];
//     astthmarFyla = json['astthmar-fyla'];
//     astthmarArd = json['astthmar-ard'];
//     astthmarAamar = json['astthmar-aamar'];
//     astthmarBytShaaby = json['astthmar-byt-shaaby'];
//     astthmarAstrah = json['astthmar-astrah'];
//     astthmarShkTmlyk = json['astthmar-shk-tmlyk'];
//     astthmarDorTmlyk = json['astthmar-dor-tmlyk'];
//     astthmarMzraa = json['astthmar-mzraa'];
//     astthmarAkhr = json['astthmar-akhr'];
//     shraaaFyla = json['shraaa-fyla'];
//     shraaaArd = json['shraaa-ard'];
//     shraaaAamar = json['shraaa-aamar'];
//     shraaaBytShaaby = json['shraaa-byt-shaaby'];
//     shraaaAstrah = json['shraaa-astrah'];
//     shraaaShkTmlyk = json['shraaa-shk-tmlyk'];
//     shraaaDorTmlyk = json['shraaa-dor-tmlyk'];
//     shraaaMzraa = json['shraaa-mzraa'];
//     shraaaAkhr = json['shraaa-akhr'];
//     astygarFyla = json['astygar-fyla'];
//     astygarArd = json['astygar-ard'];
//     astygarAamar = json['astygar-aamar'];
//     astygarBytShaaby = json['astygar-byt-shaaby'];
//     astygarAstrah = json['astygar-astrah'];
//     astygarShkTmlyk = json['astygar-shk-tmlyk'];
//     astygarDorTmlyk = json['astygar-dor-tmlyk'];
//     astygarMzraa = json['astygar-mzraa'];
//     astygarAkhr = json['astygar-akhr'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['byaa-fyla'] = this.byaaFyla;
//     data['byaa-ard'] = this.byaaArd;
//     data['byaa-aamar'] = this.byaaAamar;
//     data['byaa-byt-shaaby'] = this.byaaBytShaaby;
//     data['byaa-astrah'] = this.byaaAstrah;
//     data['byaa-shk-tmlyk'] = this.byaaShkTmlyk;
//     data['byaa-dor-tmlyk'] = this.byaaDorTmlyk;
//     data['byaa-mzraa'] = this.byaaMzraa;
//     data['byaa-akhr'] = this.byaaAkhr;
//     data['aygar-fyla'] = this.aygarFyla;
//     data['aygar-ard'] = this.aygarArd;
//     data['aygar-aamar'] = this.aygarAamar;
//     data['aygar-byt-shaaby'] = this.aygarBytShaaby;
//     data['aygar-astrah'] = this.aygarAstrah;
//     data['aygar-shk-tmlyk'] = this.aygarShkTmlyk;
//     data['aygar-dor-tmlyk'] = this.aygarDorTmlyk;
//     data['aygar-mzraa'] = this.aygarMzraa;
//     data['aygar-akhr'] = this.aygarAkhr;
//     data['astthmar-fyla'] = this.astthmarFyla;
//     data['astthmar-ard'] = this.astthmarArd;
//     data['astthmar-aamar'] = this.astthmarAamar;
//     data['astthmar-byt-shaaby'] = this.astthmarBytShaaby;
//     data['astthmar-astrah'] = this.astthmarAstrah;
//     data['astthmar-shk-tmlyk'] = this.astthmarShkTmlyk;
//     data['astthmar-dor-tmlyk'] = this.astthmarDorTmlyk;
//     data['astthmar-mzraa'] = this.astthmarMzraa;
//     data['astthmar-akhr'] = this.astthmarAkhr;
//     data['shraaa-fyla'] = this.shraaaFyla;
//     data['shraaa-ard'] = this.shraaaArd;
//     data['shraaa-aamar'] = this.shraaaAamar;
//     data['shraaa-byt-shaaby'] = this.shraaaBytShaaby;
//     data['shraaa-astrah'] = this.shraaaAstrah;
//     data['shraaa-shk-tmlyk'] = this.shraaaShkTmlyk;
//     data['shraaa-dor-tmlyk'] = this.shraaaDorTmlyk;
//     data['shraaa-mzraa'] = this.shraaaMzraa;
//     data['shraaa-akhr'] = this.shraaaAkhr;
//     data['astygar-fyla'] = this.astygarFyla;
//     data['astygar-ard'] = this.astygarArd;
//     data['astygar-aamar'] = this.astygarAamar;
//     data['astygar-byt-shaaby'] = this.astygarBytShaaby;
//     data['astygar-astrah'] = this.astygarAstrah;
//     data['astygar-shk-tmlyk'] = this.astygarShkTmlyk;
//     data['astygar-dor-tmlyk'] = this.astygarDorTmlyk;
//     data['astygar-mzraa'] = this.astygarMzraa;
//     data['astygar-akhr'] = this.astygarAkhr;
//     return data;
//   }
// }
