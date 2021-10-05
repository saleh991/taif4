class GuideModel {
  bool? status;
  int? code;
  List<Data>? data;

  GuideModel({this.status, this.code, this.data});

  GuideModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? experience_years;
  String? title;
  String? name;
  String? phone;
  String? notes;
  String? content;
  String ?createdAt;
  String? updated_at;
  String ?status;
  String ?image;



  Data(
      {this.id,
        this.title,
        this.phone,
        this.name,
        this.experience_years,
        this.createdAt,
        this.notes,
        this.status,
        this.content,
        this.updated_at,
        this.image


    });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    phone = json['phone'];
    content = json['content'];
    createdAt = json['created_at'];
    experience_years = json['experience_years'];
    status = json['status'];
    notes = json['notes'];
    updated_at = json['updated_at'];
    name = json['name'];
    image = json['image'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['phone'] = this.phone;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['updated_at'] = this.updated_at;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['image'] = this.image;
    data['experience_years'] = this.experience_years;



    return data;
  }
}



