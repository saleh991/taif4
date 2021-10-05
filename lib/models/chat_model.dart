/// chats : [{"id":1,"anotherUser":{"id":11,"phone":"112233","created_at":"2021-08-20T12:38:05.000000Z","updated_at":"2021-08-21T03:53:53.000000Z","package_id":4,"start":null,"end":null,"active":1,"image":null,"code":"5935","api_token":null,"name":"مسوق الكتروني","email":"a@a.a","package_ads":350,"package_comments":0},"messages":[{"id":1,"user_id":4,"content":"test message","created_at":"2021-08-29T18:05:55.000000Z","updated_at":"2021-08-29T18:05:55.000000Z","to_user_id":11,"chat_id":1}],"subject":{"id":1,"title":"استراحة وشالية","user_id":11,"area":"2000","price":299999,"type":"villa","category":"offer","description":"الشاليه يوفر الأستمتاع الكامل والراحه التامه لجميع أفراد العائله\r\nمرافق الشاليه \r\nعدد1صاله واسعه للجلوس بجلسه عربيه بشاشة بلازما وجلسه افرنجي مطله على المسبح\r\nعدد 2 غرفة نوم غرفة رئيسيه بسرير عائلي غرفة نوم للمرافقين مكونه من 3 اسره \r\nوكل غرفه بدورة مياه عربي وأفرنجي مستقله مجهزه بغسالة ملابس \r\nوحسب الرغبه يوجد مسبح داخلي قسمين قسم للأطفال وقسم للبالغين والمسبح مجهز بسخان وفلاتر بتقنيه عاليه\r\nويتوفر بالشاليه مطبخ مجهز بكامل الأجهزه والأدوات\r\nبالشاليه حوش واسع مغطى بالانجيله ومجهز بألعاب حركيه للأطفال وكراسي للجلوس \r\nوحسب الرغبه والأحتياج يوجد قسم أضافي ملحق بالشاليه\r\nمكون من مجلس كبير بجلسه عربيه ودورة مياه مستقله وحوش مغطى بالأنجليه \r\nومن ناحية نظافة الشاليه  نهتم بتعقيمه بعد كل مستأجر والبطاطين والمفارش نغيرها بأخرى نظيفه من المغسله بعد خروج  كل مستاجر\r\n_______________________\r\n_______________________\r\nإجار الشاليه لليوم الواحد من دون مسبح بسعر 450 ريال فقط\r\n_______________________\r\n_____________________\r\nإجار الشاليه مع المسبح لليوم الواحد بسعر 600 ريال فقط\r\n______________________\r\n______________________\r\nإجار الشاليه مع المسبح لمدة يومين بسعر 1100 ريال","show_phone":1,"comments_enabled":1,"ownership":"delegate","auth_option":"staying","side_id":1,"image":"https://opencart3.const-tech.biz/tf/storage/app/estates/4-1629518250.jpg","location_lat":"19.7561079","location_lng":"41.929559399999995","views":8,"created_at":"2021-08-21T03:57:30.000000Z","updated_at":"2021-08-27T07:22:17.000000Z","street_wide":0},"lastMessage":{"id":1,"user_id":4,"content":"test message","created_at":"2021-08-29T18:05:55.000000Z","updated_at":"2021-08-29T18:05:55.000000Z","to_user_id":11,"chat_id":1}}]
/// current_chat : null

class ChatModel {
  List<Chats>? _chats;
  Chats? _currentChat;

  List<Chats>? get chats => _chats;
  Chats? get currentChat => _currentChat;

  ChatModel({
      List<Chats>? chats,
    Chats? currentChat}){
    _chats = chats;
    _currentChat = currentChat;
}

  ChatModel.fromJson(dynamic json) {
    if (json['chats'] != null) {
      _chats = [];
      json['chats'].forEach((v) {
        _chats?.add(Chats.fromJson(v));
      });
    }
    _currentChat = Chats.fromJson(json['current_chat']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_chats != null) {
      map['chats'] = _chats?.map((v) => v.toJson()).toList();
    }
    map['current_chat'] = _currentChat;
    return map;
  }

}

/// id : 1
/// anotherUser : {"id":11,"phone":"112233","created_at":"2021-08-20T12:38:05.000000Z","updated_at":"2021-08-21T03:53:53.000000Z","package_id":4,"start":null,"end":null,"active":1,"image":null,"code":"5935","api_token":null,"name":"مسوق الكتروني","email":"a@a.a","package_ads":350,"package_comments":0}
/// messages : [{"id":1,"user_id":4,"content":"test message","created_at":"2021-08-29T18:05:55.000000Z","updated_at":"2021-08-29T18:05:55.000000Z","to_user_id":11,"chat_id":1}]
/// subject : {"id":1,"title":"استراحة وشالية","user_id":11,"area":"2000","price":299999,"type":"villa","category":"offer","description":"الشاليه يوفر الأستمتاع الكامل والراحه التامه لجميع أفراد العائله\r\nمرافق الشاليه \r\nعدد1صاله واسعه للجلوس بجلسه عربيه بشاشة بلازما وجلسه افرنجي مطله على المسبح\r\nعدد 2 غرفة نوم غرفة رئيسيه بسرير عائلي غرفة نوم للمرافقين مكونه من 3 اسره \r\nوكل غرفه بدورة مياه عربي وأفرنجي مستقله مجهزه بغسالة ملابس \r\nوحسب الرغبه يوجد مسبح داخلي قسمين قسم للأطفال وقسم للبالغين والمسبح مجهز بسخان وفلاتر بتقنيه عاليه\r\nويتوفر بالشاليه مطبخ مجهز بكامل الأجهزه والأدوات\r\nبالشاليه حوش واسع مغطى بالانجيله ومجهز بألعاب حركيه للأطفال وكراسي للجلوس \r\nوحسب الرغبه والأحتياج يوجد قسم أضافي ملحق بالشاليه\r\nمكون من مجلس كبير بجلسه عربيه ودورة مياه مستقله وحوش مغطى بالأنجليه \r\nومن ناحية نظافة الشاليه  نهتم بتعقيمه بعد كل مستأجر والبطاطين والمفارش نغيرها بأخرى نظيفه من المغسله بعد خروج  كل مستاجر\r\n_______________________\r\n_______________________\r\nإجار الشاليه لليوم الواحد من دون مسبح بسعر 450 ريال فقط\r\n_______________________\r\n_____________________\r\nإجار الشاليه مع المسبح لليوم الواحد بسعر 600 ريال فقط\r\n______________________\r\n______________________\r\nإجار الشاليه مع المسبح لمدة يومين بسعر 1100 ريال","show_phone":1,"comments_enabled":1,"ownership":"delegate","auth_option":"staying","side_id":1,"image":"https://opencart3.const-tech.biz/tf/storage/app/estates/4-1629518250.jpg","location_lat":"19.7561079","location_lng":"41.929559399999995","views":8,"created_at":"2021-08-21T03:57:30.000000Z","updated_at":"2021-08-27T07:22:17.000000Z","street_wide":0}
/// lastMessage : {"id":1,"user_id":4,"content":"test message","created_at":"2021-08-29T18:05:55.000000Z","updated_at":"2021-08-29T18:05:55.000000Z","to_user_id":11,"chat_id":1}

class Chats {
  int? _id;
  AnotherUser? _anotherUser;
  List<Messages>? _messages;
  Subject? _subject;
  LastMessage? _lastMessage;

  int? get id => _id;
  AnotherUser? get anotherUser => _anotherUser;
  List<Messages>? get messages => _messages;
  Subject? get subject => _subject;
  LastMessage? get lastMessage => _lastMessage;

  Chats({
      int? id, 
      AnotherUser? anotherUser, 
      List<Messages>? messages, 
      Subject? subject, 
      LastMessage? lastMessage}){
    _id = id;
    _anotherUser = anotherUser;
    _messages = messages;
    _subject = subject;
    _lastMessage = lastMessage;
}

  Chats.fromJson(dynamic json) {
    _id = json['id'];
    _anotherUser = json['anotherUser'] != null ? AnotherUser.fromJson(json['anotherUser']) : null;
    if (json['messages'] != null) {
      _messages = [];
      json['messages'].forEach((v) {
        _messages?.add(Messages.fromJson(v));
      });
    }
    _subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    _lastMessage = json['lastMessage'] != null ? LastMessage.fromJson(json['lastMessage']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    if (_anotherUser != null) {
      map['anotherUser'] = _anotherUser?.toJson();
    }
    if (_messages != null) {
      map['messages'] = _messages?.map((v) => v.toJson()).toList();
    }
    if (_subject != null) {
      map['subject'] = _subject?.toJson();
    }
    if (_lastMessage != null) {
      map['lastMessage'] = _lastMessage?.toJson();
    }
    return map;
  }

}

/// id : 1
/// user_id : 4
/// content : "test message"
/// created_at : "2021-08-29T18:05:55.000000Z"
/// updated_at : "2021-08-29T18:05:55.000000Z"
/// to_user_id : 11
/// chat_id : 1

class LastMessage {
  int? _id;
  int? _userId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  int? _toUserId;
  int? _chatId;

  int? get id => _id;
  int? get userId => _userId;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get toUserId => _toUserId;
  int? get chatId => _chatId;

  LastMessage({
      int? id, 
      int? userId, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      int? toUserId, 
      int? chatId}){
    _id = id;
    _userId = userId;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _toUserId = toUserId;
    _chatId = chatId;
}

  LastMessage.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _toUserId = json['to_user_id'];
    _chatId = json['chat_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['to_user_id'] = _toUserId;
    map['chat_id'] = _chatId;
    return map;
  }

}

/// id : 1
/// title : "استراحة وشالية"
/// user_id : 11
/// area : "2000"
/// price : 299999
/// type : "villa"
/// category : "offer"
/// description : "الشاليه يوفر الأستمتاع الكامل والراحه التامه لجميع أفراد العائله\r\nمرافق الشاليه \r\nعدد1صاله واسعه للجلوس بجلسه عربيه بشاشة بلازما وجلسه افرنجي مطله على المسبح\r\nعدد 2 غرفة نوم غرفة رئيسيه بسرير عائلي غرفة نوم للمرافقين مكونه من 3 اسره \r\nوكل غرفه بدورة مياه عربي وأفرنجي مستقله مجهزه بغسالة ملابس \r\nوحسب الرغبه يوجد مسبح داخلي قسمين قسم للأطفال وقسم للبالغين والمسبح مجهز بسخان وفلاتر بتقنيه عاليه\r\nويتوفر بالشاليه مطبخ مجهز بكامل الأجهزه والأدوات\r\nبالشاليه حوش واسع مغطى بالانجيله ومجهز بألعاب حركيه للأطفال وكراسي للجلوس \r\nوحسب الرغبه والأحتياج يوجد قسم أضافي ملحق بالشاليه\r\nمكون من مجلس كبير بجلسه عربيه ودورة مياه مستقله وحوش مغطى بالأنجليه \r\nومن ناحية نظافة الشاليه  نهتم بتعقيمه بعد كل مستأجر والبطاطين والمفارش نغيرها بأخرى نظيفه من المغسله بعد خروج  كل مستاجر\r\n_______________________\r\n_______________________\r\nإجار الشاليه لليوم الواحد من دون مسبح بسعر 450 ريال فقط\r\n_______________________\r\n_____________________\r\nإجار الشاليه مع المسبح لليوم الواحد بسعر 600 ريال فقط\r\n______________________\r\n______________________\r\nإجار الشاليه مع المسبح لمدة يومين بسعر 1100 ريال"
/// show_phone : 1
/// comments_enabled : 1
/// ownership : "delegate"
/// auth_option : "staying"
/// side_id : 1
/// image : "https://opencart3.const-tech.biz/tf/storage/app/estates/4-1629518250.jpg"
/// location_lat : "19.7561079"
/// location_lng : "41.929559399999995"
/// views : 8
/// created_at : "2021-08-21T03:57:30.000000Z"
/// updated_at : "2021-08-27T07:22:17.000000Z"
/// street_wide : 0

class Subject {
  int? _id;
  String? _title;
  int? _userId;
  String? _area;
  int? _price;
  String? _type;
  String? _category;
  String? _description;
  int? _showPhone;
  int? _commentsEnabled;
  String? _ownership;
  String? _authOption;
  int? _sideId;
  String? _image;
  String? _locationLat;
  String? _locationLng;
  int? _views;
  String? _createdAt;
  String? _updatedAt;
  int? _streetWide;

  int? get id => _id;
  String? get title => _title;
  int? get userId => _userId;
  String? get area => _area;
  int? get price => _price;
  String? get type => _type;
  String? get category => _category;
  String? get description => _description;
  int? get showPhone => _showPhone;
  int? get commentsEnabled => _commentsEnabled;
  String? get ownership => _ownership;
  String? get authOption => _authOption;
  int? get sideId => _sideId;
  String? get image => _image;
  String? get locationLat => _locationLat;
  String? get locationLng => _locationLng;
  int? get views => _views;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get streetWide => _streetWide;

  Subject({
      int? id, 
      String? title, 
      int? userId, 
      String? area, 
      int? price, 
      String? type, 
      String? category, 
      String? description, 
      int? showPhone, 
      int? commentsEnabled, 
      String? ownership, 
      String? authOption, 
      int? sideId, 
      String? image, 
      String? locationLat, 
      String? locationLng, 
      int? views, 
      String? createdAt, 
      String? updatedAt, 
      int? streetWide}){
    _id = id;
    _title = title;
    _userId = userId;
    _area = area;
    _price = price;
    _type = type;
    _category = category;
    _description = description;
    _showPhone = showPhone;
    _commentsEnabled = commentsEnabled;
    _ownership = ownership;
    _authOption = authOption;
    _sideId = sideId;
    _image = image;
    _locationLat = locationLat;
    _locationLng = locationLng;
    _views = views;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _streetWide = streetWide;
}

  Subject.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _userId = json['user_id'];
    _area = json['area'];
    _price = json['price'];
    _type = json['type'];
    _category = json['category'];
    _description = json['description'];
    _showPhone = json['show_phone'];
    _commentsEnabled = json['comments_enabled'];
    _ownership = json['ownership'];
    _authOption = json['auth_option'];
    _sideId = json['side_id'];
    _image = json['image'];
    _locationLat = json['location_lat'];
    _locationLng = json['location_lng'];
    _views = json['views'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _streetWide = json['street_wide'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['user_id'] = _userId;
    map['area'] = _area;
    map['price'] = _price;
    map['type'] = _type;
    map['category'] = _category;
    map['description'] = _description;
    map['show_phone'] = _showPhone;
    map['comments_enabled'] = _commentsEnabled;
    map['ownership'] = _ownership;
    map['auth_option'] = _authOption;
    map['side_id'] = _sideId;
    map['image'] = _image;
    map['location_lat'] = _locationLat;
    map['location_lng'] = _locationLng;
    map['views'] = _views;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['street_wide'] = _streetWide;
    return map;
  }

}

/// id : 1
/// user_id : 4
/// content : "test message"
/// created_at : "2021-08-29T18:05:55.000000Z"
/// updated_at : "2021-08-29T18:05:55.000000Z"
/// to_user_id : 11
/// chat_id : 1

class Messages {
  int? _id;
  int? _userId;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  int? _toUserId;
  int? _chatId;

  int? get id => _id;
  int? get userId => _userId;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get toUserId => _toUserId;
  int? get chatId => _chatId;

  Messages({
      int? id, 
      int? userId, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      int? toUserId, 
      int? chatId}){
    _id = id;
    _userId = userId;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _toUserId = toUserId;
    _chatId = chatId;
}

  Messages.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _content = json['content'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _toUserId = json['to_user_id'];
    _chatId = json['chat_id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['content'] = _content;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['to_user_id'] = _toUserId;
    map['chat_id'] = _chatId;
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

class AnotherUser {
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

  AnotherUser({
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

  AnotherUser.fromJson(dynamic json) {
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