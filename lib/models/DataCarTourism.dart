

class DataCarTourism {
  List<DataTourismModule>? data;
  int? code;
  bool? status;

  DataCarTourism({this.data, this.code, this.status});

  DataCarTourism.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new DataTourismModule.fromJson(v));
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

class DataTourismModule {
  int ?id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? icon;

  DataTourismModule({this.id, this.name, this.createdAt, this.updatedAt, this.icon});

  DataTourismModule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['icon'] = this.icon;
    return data;
  }
}
