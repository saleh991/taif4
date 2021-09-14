class UserCommentModel{

  String? name;
  String? image;
  String? comment;

  UserCommentModel({this.image,this.name,this.comment});

  UserCommentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    comment = json['comment'];
  }


}