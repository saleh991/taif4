/// data : {"id":1,"title":"استراحة وشالية","category":{"id":1,"name":"عروض عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"},"type":"villa","auth_option":"staying","ownership":"delegate","area":"2000","street_wide":0,"price":299999,"description":"الشاليه يوفر الأستمتاع الكامل والراحه التامه لجميع أفراد العائله\r\nمرافق الشاليه \r\nعدد1صاله واسعه للجلوس بجلسه عربيه بشاشة بلازما وجلسه افرنجي مطله على المسبح\r\nعدد 2 غرفة نوم غرفة رئيسيه بسرير عائلي غرفة نوم للمرافقين مكونه من 3 اسره \r\nوكل غرفه بدورة مياه عربي وأفرنجي مستقله مجهزه بغسالة ملابس \r\nوحسب الرغبه يوجد مسبح داخلي قسمين قسم للأطفال وقسم للبالغين والمسبح مجهز بسخان وفلاتر بتقنيه عاليه\r\nويتوفر بالشاليه مطبخ مجهز بكامل الأجهزه والأدوات\r\nبالشاليه حوش واسع مغطى بالانجيله ومجهز بألعاب حركيه للأطفال وكراسي للجلوس \r\nوحسب الرغبه والأحتياج يوجد قسم أضافي ملحق بالشاليه\r\nمكون من مجلس كبير بجلسه عربيه ودورة مياه مستقله وحوش مغطى بالأنجليه \r\nومن ناحية نظافة الشاليه  نهتم بتعقيمه بعد كل مستأجر والبطاطين والمفارش نغيرها بأخرى نظيفه من المغسله بعد خروج  كل مستاجر\r\n_______________________\r\n_______________________\r\nإجار الشاليه لليوم الواحد من دون مسبح بسعر 450 ريال فقط\r\n_______________________\r\n_____________________\r\nإجار الشاليه مع المسبح لليوم الواحد بسعر 600 ريال فقط\r\n______________________\r\n______________________\r\nإجار الشاليه مع المسبح لمدة يومين بسعر 1100 ريال","created_at":"2021-08-21T03:57:30.000000Z","location_lat":"19.7561079","location_lng":"41.929559399999995","main_image":"estates/4-1629518250.jpg","images":[{"id":42,"path":"images/_1_.jpg-4-1629518250.jpg","viewable_type":"App\\Models\\Estate","viewable_id":1,"created_at":"2021-08-21T03:57:31.000000Z","updated_at":"2021-08-21T03:57:31.000000Z"},{"id":43,"path":"images/2021_1_3_15_39_54_332.jpg-4-1629518251.jpg","viewable_type":"App\\Models\\Estate","viewable_id":1,"created_at":"2021-08-21T03:57:31.000000Z","updated_at":"2021-08-21T03:57:31.000000Z"},{"id":44,"path":"images/تنزيل.jfif-4-1629518251.jfif","viewable_type":"App\\Models\\Estate","viewable_id":1,"created_at":"2021-08-21T03:57:31.000000Z","updated_at":"2021-08-21T03:57:31.000000Z"}],"media":[],"views":8,"comments":[{"id":3,"user_id":4,"subject_id":1,"content":"test comment","created_at":"2021-08-28T15:20:12.000000Z","updated_at":"2021-08-28T15:20:12.000000Z","subject_class":"App\\Models\\Estate"},{"id":5,"user_id":4,"subject_id":1,"content":"test comment","created_at":"2021-09-04T01:47:36.000000Z","updated_at":"2021-09-04T01:47:36.000000Z","subject_class":"App\\Models\\Estate"}],"user":{"id":11,"phone":"112233","created_at":"2021-08-20T12:38:05.000000Z","updated_at":"2021-08-21T03:53:53.000000Z","package_id":4,"start":null,"end":null,"active":1,"image":null,"code":"5935","api_token":null,"name":"مسوق الكتروني","email":"a@a.a","package_ads":350,"package_comments":0},"side":{"id":1,"name":"شرق","created_at":"2021-08-12T07:18:26.000000Z","updated_at":"2021-08-12T07:18:26.000000Z"},"show_phone":1,"comments_enabled":1}
/// code : 200
/// status : true

class EstateOnlyModel {
  Data? _data;
  int? _code;
  bool? _status;

  Data? get data => _data;
  int? get code => _code;
  bool? get status => _status;

  EstateOnlyModel({
      Data? data, 
      int? code, 
      bool? status}){
    _data = data;
    _code = code;
    _status = status;
}

  EstateOnlyModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _code = json['code'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['code'] = _code;
    map['status'] = _status;
    return map;
  }

}

/// id : 1
/// title : "استراحة وشالية"
/// category : {"id":1,"name":"عروض عقارية","created_at":"2021-09-01T19:13:22.000000Z","updated_at":"2021-09-01T19:13:22.000000Z"}
/// type : "villa"
/// auth_option : "staying"
/// ownership : "delegate"
/// area : "2000"
/// street_wide : 0
/// price : 299999
/// description : "الشاليه يوفر الأستمتاع الكامل والراحه التامه لجميع أفراد العائله\r\nمرافق الشاليه \r\nعدد1صاله واسعه للجلوس بجلسه عربيه بشاشة بلازما وجلسه افرنجي مطله على المسبح\r\nعدد 2 غرفة نوم غرفة رئيسيه بسرير عائلي غرفة نوم للمرافقين مكونه من 3 اسره \r\nوكل غرفه بدورة مياه عربي وأفرنجي مستقله مجهزه بغسالة ملابس \r\nوحسب الرغبه يوجد مسبح داخلي قسمين قسم للأطفال وقسم للبالغين والمسبح مجهز بسخان وفلاتر بتقنيه عاليه\r\nويتوفر بالشاليه مطبخ مجهز بكامل الأجهزه والأدوات\r\nبالشاليه حوش واسع مغطى بالانجيله ومجهز بألعاب حركيه للأطفال وكراسي للجلوس \r\nوحسب الرغبه والأحتياج يوجد قسم أضافي ملحق بالشاليه\r\nمكون من مجلس كبير بجلسه عربيه ودورة مياه مستقله وحوش مغطى بالأنجليه \r\nومن ناحية نظافة الشاليه  نهتم بتعقيمه بعد كل مستأجر والبطاطين والمفارش نغيرها بأخرى نظيفه من المغسله بعد خروج  كل مستاجر\r\n_______________________\r\n_______________________\r\nإجار الشاليه لليوم الواحد من دون مسبح بسعر 450 ريال فقط\r\n_______________________\r\n_____________________\r\nإجار الشاليه مع المسبح لليوم الواحد بسعر 600 ريال فقط\r\n______________________\r\n______________________\r\nإجار الشاليه مع المسبح لمدة يومين بسعر 1100 ريال"
/// created_at : "2021-08-21T03:57:30.000000Z"
/// location_lat : "19.7561079"
/// location_lng : "41.929559399999995"
/// main_image : "estates/4-1629518250.jpg"
/// images : [{"id":42,"path":"images/_1_.jpg-4-1629518250.jpg","viewable_type":"App\\Models\\Estate","viewable_id":1,"created_at":"2021-08-21T03:57:31.000000Z","updated_at":"2021-08-21T03:57:31.000000Z"},{"id":43,"path":"images/2021_1_3_15_39_54_332.jpg-4-1629518251.jpg","viewable_type":"App\\Models\\Estate","viewable_id":1,"created_at":"2021-08-21T03:57:31.000000Z","updated_at":"2021-08-21T03:57:31.000000Z"},{"id":44,"path":"images/تنزيل.jfif-4-1629518251.jfif","viewable_type":"App\\Models\\Estate","viewable_id":1,"created_at":"2021-08-21T03:57:31.000000Z","updated_at":"2021-08-21T03:57:31.000000Z"}]
/// media : []
/// views : 8
/// comments : [{"id":3,"user_id":4,"subject_id":1,"content":"test comment","created_at":"2021-08-28T15:20:12.000000Z","updated_at":"2021-08-28T15:20:12.000000Z","subject_class":"App\\Models\\Estate"},{"id":5,"user_id":4,"subject_id":1,"content":"test comment","created_at":"2021-09-04T01:47:36.000000Z","updated_at":"2021-09-04T01:47:36.000000Z","subject_class":"App\\Models\\Estate"}]
/// user : {"id":11,"phone":"112233","created_at":"2021-08-20T12:38:05.000000Z","updated_at":"2021-08-21T03:53:53.000000Z","package_id":4,"start":null,"end":null,"active":1,"image":null,"code":"5935","api_token":null,"name":"مسوق الكتروني","email":"a@a.a","package_ads":350,"package_comments":0}
/// side : {"id":1,"name":"شرق","created_at":"2021-08-12T07:18:26.000000Z","updated_at":"2021-08-12T07:18:26.000000Z"}
/// show_phone : 1
/// comments_enabled : 1

class Data {
  int? _id;
  String? _title;
  Category? _category;
  String? _type;
  String? _authOption;
  String? _ownership;
  String? _area;
  int? _streetWide;
  int? _price;
  String? _description;
  String? _createdAt;
  String? _locationLat;
  String? _locationLng;
  String? _mainImage;
  List<Images>? _images;
  List<dynamic>? _media;
  int? _views;
  List<Comments>? _comments;
  User? _user;
  Side? _side;
  int? _showPhone;
  int? _commentsEnabled;

  int? get id => _id;
  String? get title => _title;
  Category? get category => _category;
  String? get type => _type;
  String? get authOption => _authOption;
  String? get ownership => _ownership;
  String? get area => _area;
  int? get streetWide => _streetWide;
  int? get price => _price;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get locationLat => _locationLat;
  String? get locationLng => _locationLng;
  String? get mainImage => _mainImage;
  List<Images>? get images => _images;
  List<dynamic>? get media => _media;
  int? get views => _views;
  List<Comments>? get comments => _comments;
  User? get user => _user;
  Side? get side => _side;
  int? get showPhone => _showPhone;
  int? get commentsEnabled => _commentsEnabled;

  Data({
      int? id, 
      String? title, 
      Category? category, 
      String? type, 
      String? authOption, 
      String? ownership, 
      String? area, 
      int? streetWide, 
      int? price, 
      String? description, 
      String? createdAt, 
      String? locationLat, 
      String? locationLng, 
      String? mainImage, 
      List<Images>? images, 
      List<dynamic>? media, 
      int? views, 
      List<Comments>? comments, 
      User? user, 
      Side? side, 
      int? showPhone, 
      int? commentsEnabled}){
    _id = id;
    _title = title;
    _category = category;
    _type = type;
    _authOption = authOption;
    _ownership = ownership;
    _area = area;
    _streetWide = streetWide;
    _price = price;
    _description = description;
    _createdAt = createdAt;
    _locationLat = locationLat;
    _locationLng = locationLng;
    _mainImage = mainImage;
    _images = images;
    _media = media;
    _views = views;
    _comments = comments;
    _user = user;
    _side = side;
    _showPhone = showPhone;
    _commentsEnabled = commentsEnabled;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _type = json['type'];
    _authOption = json['auth_option'];
    _ownership = json['ownership'];
    _area = json['area'];
    _streetWide = json['street_wide'];
    _price = json['price'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _locationLat = json['location_lat'];
    _locationLng = json['location_lng'];
    _mainImage = json['main_image'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    // if (json['media'] != null) {
    //   _media = [];
    //   json['media'].forEach((v) {
    //     _media?.add(dynamic.fromJson(v));
    //   });
    // }
    _views = json['views'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _side = json['side'] != null ? Side.fromJson(json['side']) : null;
    _showPhone = json['show_phone'];
    _commentsEnabled = json['comments_enabled'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['type'] = _type;
    map['auth_option'] = _authOption;
    map['ownership'] = _ownership;
    map['area'] = _area;
    map['street_wide'] = _streetWide;
    map['price'] = _price;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['location_lat'] = _locationLat;
    map['location_lng'] = _locationLng;
    map['main_image'] = _mainImage;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    map['views'] = _views;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_side != null) {
      map['side'] = _side?.toJson();
    }
    map['show_phone'] = _showPhone;
    map['comments_enabled'] = _commentsEnabled;
    return map;
  }

}

/// id : 1
/// name : "شرق"
/// created_at : "2021-08-12T07:18:26.000000Z"
/// updated_at : "2021-08-12T07:18:26.000000Z"

class Side {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Side({
      int? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Side.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 11
/// phone : "112233"
/// created_at : "2021-08-20T12:38:05.000000Z"
/// updated_at : "2021-08-21T03:53:53.000000Z"
/// package_id : 4
/// start : null
/// end : null
/// active : 1
/// image : null
/// code : "5935"
/// api_token : null
/// name : "مسوق الكتروني"
/// email : "a@a.a"
/// package_ads : 350
/// package_comments : 0

class User {
  int? _id;
  String? _phone;
  String? _createdAt;
  String? _updatedAt;
  int? _packageId;
  dynamic? _start;
  dynamic? _end;
  int? _active;
  dynamic? _image;
  String? _code;
  dynamic? _apiToken;
  String? _name;
  String? _email;
  int? _packageAds;
  int? _packageComments;

  int? get id => _id;
  String? get phone => _phone;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get packageId => _packageId;
  dynamic? get start => _start;
  dynamic? get end => _end;
  int? get active => _active;
  dynamic? get image => _image;
  String? get code => _code;
  dynamic? get apiToken => _apiToken;
  String? get name => _name;
  String? get email => _email;
  int? get packageAds => _packageAds;
  int? get packageComments => _packageComments;

  User({
      int? id, 
      String? phone, 
      String? createdAt, 
      String? updatedAt, 
      int? packageId, 
      dynamic? start, 
      dynamic? end, 
      int? active, 
      dynamic? image, 
      String? code, 
      dynamic? apiToken, 
      String? name, 
      String? email, 
      int? packageAds, 
      int? packageComments}){
    _id = id;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _packageId = packageId;
    _start = start;
    _end = end;
    _active = active;
    _image = image;
    _code = code;
    _apiToken = apiToken;
    _name = name;
    _email = email;
    _packageAds = packageAds;
    _packageComments = packageComments;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _packageId = json['package_id'];
    _start = json['start'];
    _end = json['end'];
    _active = json['active'];
    _image = json['image'];
    _code = json['code'];
    _apiToken = json['api_token'];
    _name = json['name'];
    _email = json['email'];
    _packageAds = json['package_ads'];
    _packageComments = json['package_comments'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['package_id'] = _packageId;
    map['start'] = _start;
    map['end'] = _end;
    map['active'] = _active;
    map['image'] = _image;
    map['code'] = _code;
    map['api_token'] = _apiToken;
    map['name'] = _name;
    map['email'] = _email;
    map['package_ads'] = _packageAds;
    map['package_comments'] = _packageComments;
    return map;
  }

}

/// id : 3
/// user_id : 4
/// subject_id : 1
/// content : "test comment"
/// created_at : "2021-08-28T15:20:12.000000Z"
/// updated_at : "2021-08-28T15:20:12.000000Z"
/// subject_class : "App\\Models\\Estate"

class Comments {
  int? _id;
  int? _userId;
  int? _subjectId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  String? _subjectClass;

  int? get id => _id;
  int? get userId => _userId;
  int? get subjectId => _subjectId;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get subjectClass => _subjectClass;

  Comments({
      int? id, 
      int? userId, 
      int? subjectId, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      String? subjectClass}){
    _id = id;
    _userId = userId;
    _subjectId = subjectId;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _subjectClass = subjectClass;
}

  Comments.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _subjectId = json['subject_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _subjectClass = json['subject_class'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['subject_id'] = _subjectId;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['subject_class'] = _subjectClass;
    return map;
  }

}

/// id : 42
/// path : "images/_1_.jpg-4-1629518250.jpg"
/// viewable_type : "App\\Models\\Estate"
/// viewable_id : 1
/// created_at : "2021-08-21T03:57:31.000000Z"
/// updated_at : "2021-08-21T03:57:31.000000Z"

class Images {
  int? _id;
  String? _path;
  String? _viewableType;
  int? _viewableId;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get path => _path;
  String? get viewableType => _viewableType;
  int? get viewableId => _viewableId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Images({
      int? id, 
      String? path, 
      String? viewableType, 
      int? viewableId, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _path = path;
    _viewableType = viewableType;
    _viewableId = viewableId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _path = json['path'];
    _viewableType = json['viewable_type'];
    _viewableId = json['viewable_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['path'] = _path;
    map['viewable_type'] = _viewableType;
    map['viewable_id'] = _viewableId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// name : "عروض عقارية"
/// created_at : "2021-09-01T19:13:22.000000Z"
/// updated_at : "2021-09-01T19:13:22.000000Z"

class Category {
  int? _id;
  String? _name;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get name => _name;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Category({
      int? id, 
      String? name, 
      String? createdAt, 
      String? updatedAt}){
    _id = id;
    _name = name;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}