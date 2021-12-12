

class DataDistricts {
  bool? status;
  int? code;
  DataDistrictsModule? dataDistrictsModule;

  DataDistricts({this.status, this.code, this.dataDistrictsModule});

  DataDistricts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    dataDistrictsModule = json['data'] != null ? new DataDistrictsModule.fromJson(json['data']) : null;
  }


}

class DataDistrictsModule {
  List<Districts>? districts;
  List<Types>? types;
  List<Sides>? sides;

  DataDistrictsModule({this.districts, this.types, this.sides});

  DataDistrictsModule.fromJson(Map<String, dynamic> json) {
    if (json['districts'] != null) {
      districts = [];
      json['districts'].forEach((v) {
        districts!.add(new Districts.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = [];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    if (json['sides'] != null) {
      sides = [];
      json['sides'].forEach((v) {
        sides!.add(new Sides.fromJson(v));
      });
    }
  }

}

class Districts {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Districts(
      {this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Types {
  String? key;
  String? value;

  Types({this.key, this.value});

  Types.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Sides {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Sides({this.id, this.name, this.createdAt, this.updatedAt});

  Sides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
