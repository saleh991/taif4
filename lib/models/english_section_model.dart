class EnglishSectionModel {
  bool? status;
  int? code;
  List<Data>? data;

  EnglishSectionModel({this.status, this.code, this.data});

  EnglishSectionModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? phone;
  String? content;
  String ?createdAt;
  String? locationLat;
  String? locationLng;
  String? image;
  String? media;
  int? views;


  Data(
      {this.id,
        this.title,
        this.phone,
        this.content,
        this.createdAt,
        this.locationLat,
        this.locationLng,
        this.image,
        this.media,
        this.views,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    phone = json['phone'];
    content = json['content'];
    createdAt = json['created_at'];
    locationLat = json['location_lat'];
    locationLng = json['location_lng'];
    image = json['image'];

    views = json['views'];
    // if (json['comments'] != null) {
    //   comments =  <String>[];
    //   json['comments'].forEach((v) {
    //     comments!.add(String.fromJson(v));
    //   });
    // }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;

    data['phone'] = this.phone;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['location_lat'] = this.locationLat;
    data['location_lng'] = this.locationLng;
    data['image'] = this.image;

    data['views'] = this.views;
    // if (this.comments != null) {
    //  // data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    // }

    return data;
  }
}







