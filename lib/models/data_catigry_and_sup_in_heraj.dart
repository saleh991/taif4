


class DataCatigryAndSupInHeraj {
  bool? status;
  List<DataCataGryAndSu_Haraj> ?dataCataGryAndSu_Haraj;

  DataCatigryAndSupInHeraj({this.status, this.dataCataGryAndSu_Haraj});

  DataCatigryAndSupInHeraj.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      dataCataGryAndSu_Haraj =[];
      json['data'].forEach((v) {
        dataCataGryAndSu_Haraj!.add(new DataCataGryAndSu_Haraj.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dataCataGryAndSu_Haraj != null) {
      data['data'] = this.dataCataGryAndSu_Haraj!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataCataGryAndSu_Haraj {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  var parentId;
  List<Categories>? categories;

  DataCataGryAndSu_Haraj(
      {this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.parentId,
        this.categories});

  DataCataGryAndSu_Haraj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentId = json['parent_id'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_id'] = this.parentId;
    if (this.categories != null) {
      data['categories'] = this.categories?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String ?name;
  String? createdAt;
  String? updatedAt;
  int ?parentId;

  Categories(
      {this.id, this.name, this.createdAt, this.updatedAt, this.parentId});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parentId = json['parent_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parent_id'] = this.parentId;
    return data;
  }
}
