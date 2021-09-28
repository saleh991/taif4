

class TermsModel {
  Data? _data;
  bool? _status;
  int? _code;

    Data? get data => _data;
  bool? get status => _status;
  int? get code => _code;

  TermsModel({
      Data? data,
      bool? status, 
      int? code})
  {
    _data = data;
    _status = status;
    _code = code;
}

  TermsModel.fromJson(dynamic json) {

      _data = Data.fromJson(json['data']);
    _status = json['status'];
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

      map['data'] = _data;

    map['status'] = _status;
    map['code'] = _code;
    return map;
  }

}



class Data {
  int? _id;
  String? _title;
  String? _content;


  int? get id => _id;
  String? get title => _title;
  String? get content => _content;


    Data({
      int? id,
      String? title,
  String? content,


  })
    {
      id=_id;
      title=_title;
      content=_content;
    }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _content=json['content'];




  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['content'] = _content;



    return map;
  }

}

