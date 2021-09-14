class ContactModel {
  Data? data;
  int? code;
  bool? status;

  ContactModel({this.data, this.code, this.status});

  ContactModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? subject;
  String? email;
  String? mobile;
  String? name;
  String? message;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.subject,
        this.email,
        this.mobile,
        this.name,
        this.message,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    email = json['email'];
    mobile = json['mobile'];
    name = json['name'];
    message = json['message'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['message'] = this.message;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
