import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));
List<PostModel> postsFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String? title;
  String? body;
  int? id;

  PostModel({
    this.title,
    this.body,
    this.id,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        title: json["title"],
        body: json["body"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "id": id,
      };
}
