/// status : true
/// code : 221
/// message : "تم ارسال كود الدخول الي رقم الهاتف المسجل لدينا"
/// data : {"code":6093,"id":38}

class RegisterModel {
  bool? _status;
  int? _code;
  String? _message;
  Data? _data;

  bool? get status => _status;
  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  RegisterModel({
      bool? status, 
      int? code, 
      String? message, 
      Data? data}){
    _status = status;
    _code = code;
    _message = message;
    _data = data;
}

  RegisterModel.fromJson(dynamic json) {
    _status = json['status'];
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// code : 6093
/// id : 38

class Data {
  int? _code;
  int? _id;

  int? get code => _code;
  int? get id => _id;

  Data({
      int? code, 
      int? id}){
    _code = code;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _code = json['code'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['id'] = _id;
    return map;
  }

}