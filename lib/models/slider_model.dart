class SliderModel {
  List<Data>? data;
  int? code;
  bool? status;

  SliderModel({this.data, this.code, this.status});

  SliderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? active;
  String? text1;
  String? text2;

  Data(
      {this.id,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.active,
        this.text1,
        this.text2});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    active = json['active'];
    text1 = json['text_1'];
    text2 = json['text_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active'] = this.active;
    data['text_1'] = this.text1;
    data['text_2'] = this.text2;
    return data;
  }
}
