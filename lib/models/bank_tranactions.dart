/// data : {"account_name":"ahmed","account_number":"2665","bank_name":"alahly","date":"2021-8-8","amount":"200","image":"bankTransactions/-1630273200.png","updated_at":"2021-08-29T21:40:00.000000Z","created_at":"2021-08-29T21:40:00.000000Z","id":9}
/// code : 200
/// status : true

class BankTranactions {
  Data? _data;
  int? _code;
  bool? _status;

  Data? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  BankTranactions({
      Data? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  BankTranactions.fromJson(dynamic json) {
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

/// account_name : "ahmed"
/// account_number : "2665"
/// bank_name : "alahly"
/// date : "2021-8-8"
/// amount : "200"
/// image : "bankTransactions/-1630273200.png"
/// updated_at : "2021-08-29T21:40:00.000000Z"
/// created_at : "2021-08-29T21:40:00.000000Z"
/// id : 9

class Data {
  String? _accountName;
  String? _accountNumber;
  String? _bankName;
  String? _date;
  String? _amount;
  String? _image;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get accountName => _accountName;
  String? get accountNumber => _accountNumber;
  String? get bankName => _bankName;
  String? get date => _date;
  String? get amount => _amount;
  String? get image => _image;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Data({
      String? accountName, 
      String? accountNumber, 
      String? bankName, 
      String? date, 
      String? amount, 
      String? image, 
      String? updatedAt, 
      String? createdAt, 
      int? id}){
    _accountName = accountName;
    _accountNumber = accountNumber;
    _bankName = bankName;
    _date = date;
    _amount = amount;
    _image = image;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _accountName = json['account_name'];
    _accountNumber = json['account_number'];
    _bankName = json['bank_name'];
    _date = json['date'];
    _amount = json['amount'];
    _image = json['image'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['account_name'] = _accountName;
    map['account_number'] = _accountNumber;
    map['bank_name'] = _bankName;
    map['date'] = _date;
    map['amount'] = _amount;
    map['image'] = _image;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}