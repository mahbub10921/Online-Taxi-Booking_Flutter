// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

NewRegis postModelFromJson(String str) => NewRegis.fromJson(json.decode(str));
List<NewRegis> postsFromJson6(String str) =>
    List<NewRegis>.from(json.decode(str).map((x) => NewRegis.fromJson(x)));

String postModelToJson(NewRegis data) => json.encode(data.toJson());

class NewRegis {
  String? name;
  String? email;
  String? number;
  String? password;
  String? regis;
  String? model;
  String? category;
  int? id;

  NewRegis({
    this.name,
    this.email,
    this.number,
    this.password,
    this.regis,
    this.model,
    this.category,
    this.id,
  });

  factory NewRegis.fromJson(Map<String, dynamic> json) => NewRegis(
        name: json["name"],
        email: json["email"],
        number: json["number"],
        password: json["password"],
        regis: json["regis"],
        model: json["model"],
        category: json["category"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "number": number,
        "password": password,
        "regis": regis,
        "model": model,
        "category": category,
        "id": id,
      };
}
