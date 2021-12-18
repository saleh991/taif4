/// data : {"id":4,"phone":"123123","created_at":"2021-08-10T20:17:39.000000Z","updated_at":"2021-08-29T14:49:07.000000Z","start":"2021-08-11","end":"2022-11-02","active":1,"image":"users/D1T_miAWwAE6KhM.jpg-4-1629048410.jpg","code":"9237","api_token":null,"name":"محم٢٢٢","email":"mmm@mmm.com","currentSub":{"id":50,"user_id":4,"package_id":4,"from":"2021-08-27","to":"2022-01-28","activated":1,"created_at":"2021-08-28T15:26:30.000000Z","updated_at":"2021-08-28T15:26:30.000000Z","remainning_ads":346,"comments_enabled":1,"package":{"id":4,"name":"الماسي","ads_count":350,"cost":4000,"created_at":"2021-06-27T17:31:15.000000Z","updated_at":"2021-06-27T17:31:15.000000Z","comments_enabled":1,"months":1}}}
/// code : 200
/// status : true

class UserDataModel {
  Data? _data;
  int? _code;
  bool? _status;

  Data? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  UserDataModel({
      Data? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  UserDataModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _code = json['code'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['code'] = _code;
    map['status'] = _status;
    return map;
  }

}

/// id : 4
/// phone : "123123"
/// created_at : "2021-08-10T20:17:39.000000Z"
/// updated_at : "2021-08-29T14:49:07.000000Z"
/// start : "2021-08-11"
/// end : "2022-11-02"
/// active : 1
/// image : "users/D1T_miAWwAE6KhM.jpg-4-1629048410.jpg"
/// code : "9237"
/// api_token : null
/// name : "محم٢٢٢"
/// email : "mmm@mmm.com"
/// currentSub : {"id":50,"user_id":4,"package_id":4,"from":"2021-08-27","to":"2022-01-28","activated":1,"created_at":"2021-08-28T15:26:30.000000Z","updated_at":"2021-08-28T15:26:30.000000Z","remainning_ads":346,"comments_enabled":1,"package":{"id":4,"name":"الماسي","ads_count":350,"cost":4000,"created_at":"2021-06-27T17:31:15.000000Z","updated_at":"2021-06-27T17:31:15.000000Z","comments_enabled":1,"months":1}}

class Data {
  int? _id;
  String? _phone;
  String? _createdAt;
  String? _updatedAt;
  String? _start;
  String? _end;
  int? _active;
  String? _image;
  String? _code;
  var _apiToken;
  String? _name;
  String? _email;
  CurrentSub? _currentSub;

  int? get id => _id;
  String? get phone => _phone;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get start => _start;
  String? get end => _end;
  int? get active => _active;
  String? get image => _image;
  String? get code => _code;
  dynamic? get apiToken => _apiToken;
  String? get name => _name;
  String? get email => _email;
  CurrentSub? get currentSub => _currentSub;

  Data({
      int? id, 
      String? phone, 
      String? createdAt, 
      String? updatedAt, 
      String? start, 
      String? end, 
      int? active, 
      String? image, 
      String? code, 
      dynamic? apiToken, 
      String? name, 
      String? email, 
      CurrentSub? currentSub}){
    _id = id;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _start = start;
    _end = end;
    _active = active;
    _image = image;
    _code = code;
    _apiToken = apiToken;
    _name = name;
    _email = email;
    _currentSub = currentSub;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _start = json['start'];
    _end = json['end'];
    _active = json['active'];
    _image = json['image'];
    _code = json['code'];
    _apiToken = json['api_token'].toString();
    _name = json['name'];
    _email = json['email'];
    _currentSub = json['currentSub'] != null ? CurrentSub.fromJson(json['currentSub']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['start'] = _start;
    map['end'] = _end;
    map['active'] = _active;
    map['image'] = _image;
    map['code'] = _code;
    map['api_token'] = _apiToken;
    map['name'] = _name;
    map['email'] = _email;
    if (_currentSub != null) {
      map['currentSub'] = _currentSub?.toJson();
    }
    return map;
  }

}

/// id : 50
/// user_id : 4
/// package_id : 4
/// from : "2021-08-27"
/// to : "2022-01-28"
/// activated : 1
/// created_at : "2021-08-28T15:26:30.000000Z"
/// updated_at : "2021-08-28T15:26:30.000000Z"
/// remainning_ads : 346
/// comments_enabled : 1
/// package : {"id":4,"name":"الماسي","ads_count":350,"cost":4000,"created_at":"2021-06-27T17:31:15.000000Z","updated_at":"2021-06-27T17:31:15.000000Z","comments_enabled":1,"months":1}

class CurrentSub {
  int? _id;
  int? _userId;
  int? _packageId;
  String? _from;
  String? _to;
  int? _activated;
  String? _createdAt;
  String? _updatedAt;
  int? _remainningAds;
  int? _commentsEnabled;
  Package? _package;

  int? get id => _id;
  int? get userId => _userId;
  int? get packageId => _packageId;
  String? get from => _from;
  String? get to => _to;
  int? get activated => _activated;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get remainningAds => _remainningAds;
  int? get commentsEnabled => _commentsEnabled;
  Package? get package => _package;

  CurrentSub({
      int? id, 
      int? userId, 
      int? packageId, 
      String? from, 
      String? to, 
      int? activated, 
      String? createdAt, 
      String? updatedAt, 
      int? remainningAds, 
      int? commentsEnabled, 
      Package? package}){
    _id = id;
    _userId = userId;
    _packageId = packageId;
    _from = from;
    _to = to;
    _activated = activated;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _remainningAds = remainningAds;
    _commentsEnabled = commentsEnabled;
    _package = package;
}

  CurrentSub.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _packageId = json['package_id'];
    _from = json['from'];
    _to = json['to'];
    _activated = json['activated'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _remainningAds = json['remainning_ads'];
    _commentsEnabled = json['comments_enabled'];
    _package = json['package'] != null ? Package.fromJson(json['package']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['package_id'] = _packageId;
    map['from'] = _from;
    map['to'] = _to;
    map['activated'] = _activated;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['remainning_ads'] = _remainningAds;
    map['comments_enabled'] = _commentsEnabled;
    if (_package != null) {
      map['package'] = _package?.toJson();
    }
    return map;
  }

}

/// id : 4
/// name : "الماسي"
/// ads_count : 350
/// cost : 4000
/// created_at : "2021-06-27T17:31:15.000000Z"
/// updated_at : "2021-06-27T17:31:15.000000Z"
/// comments_enabled : 1
/// months : 1

class Package {
  int? _id;
  String? _name;
  int? _adsCount;
  int? _cost;
  String? _createdAt;
  String? _updatedAt;
  int? _commentsEnabled;
  int? _months;

  int? get id => _id;
  String? get name => _name;
  int? get adsCount => _adsCount;
  int? get cost => _cost;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get commentsEnabled => _commentsEnabled;
  int? get months => _months;

  Package({
      int? id, 
      String? name, 
      int? adsCount, 
      int? cost, 
      String? createdAt, 
      String? updatedAt, 
      int? commentsEnabled, 
      int? months}){
    _id = id;
    _name = name;
    _adsCount = adsCount;
    _cost = cost;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _commentsEnabled = commentsEnabled;
    _months = months;
}

  Package.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _adsCount = json['ads_count'];
    _cost = json['cost'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _commentsEnabled = json['comments_enabled'];
    _months = json['months'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['ads_count'] = _adsCount;
    map['cost'] = _cost;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['comments_enabled'] = _commentsEnabled;
    map['months'] = _months;
    return map;
  }

}