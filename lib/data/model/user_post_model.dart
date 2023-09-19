// To parse this JSON data, do
//
//     final userPostModel = userPostModelFromJson(jsonString);


class UserPostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserPostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) => UserPostModel(
        userId: json["userId"] ?? 0,
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  static List<UserPostModel> jsonToUserModelList(
          List<dynamic> emote) =>
      emote.map<UserPostModel>((item) => UserPostModel.fromJson(item)).toList();
}
