class AddGuideModel {
  bool? status;
  int? code;
  String? errors_string;

  AddGuideModel({this.status, this.code, this.errors_string});

  AddGuideModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    errors_string = json['errors_string'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['errors_string'] = this.errors_string;

    return data;
  }
}





