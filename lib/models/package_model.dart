class PackageModel {
  List<Data>? data;
  int? code;
  bool? status;

  PackageModel({this.data, this.code, this.status});

  PackageModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  int? adsCount;
  int? cost;
  String? createdAt;
  String? updatedAt;
  int? commentsEnabled;

  Data(
      {this.id,
        this.name,
        this.adsCount,
        this.cost,
        this.createdAt,
        this.updatedAt,
        this.commentsEnabled});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adsCount = json['ads_count'];
    cost = json['cost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    commentsEnabled = json['comments_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ads_count'] = this.adsCount;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['comments_enabled'] = this.commentsEnabled;
    return data;
  }
}