// To parse this JSON data, do
//
//     final charcterModel = charcterModelFromJson(jsonString);

import 'dart:convert';

CharcterModel charcterModelFromJson(String str) =>
    CharcterModel.fromJson(json.decode(str));

String charcterModelToJson(CharcterModel data) => json.encode(data.toJson());

class CharcterModel {
  CharcterModel({
    this.charId,
    this.name,
    this.birthday,
    this.occupation,
    this.img,
    this.status,
    this.nickname,
    this.appearance,
    this.portrayed,
    this.category,
    this.betterCallSaulAppearance,
  });

  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;

  factory CharcterModel.fromJson(Map<String, dynamic> json) => CharcterModel(
        charId: json["char_id"] == null ? null : json["char_id"],
        name: json["name"] == null ? null : json["name"],
        birthday: json["birthday"] == null ? null : json["birthday"],
        occupation: json["occupation"] == null
            ? null
            : List<String>.from(json["occupation"].map((x) => x)),
        img: json["img"] == null ? null : json["img"],
        status: json["status"] == null ? null : json["status"],
        nickname: json["nickname"] == null ? null : json["nickname"],
        appearance: json["appearance"] == null
            ? null
            : List<int>.from(json["appearance"].map((x) => x)),
        portrayed: json["portrayed"] == null ? null : json["portrayed"],
        category: json["category"] == null ? null : json["category"],
        betterCallSaulAppearance: json["better_call_saul_appearance"] == null
            ? null
            : List<dynamic>.from(
                json["better_call_saul_appearance"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "char_id": charId == null ? null : charId,
        "name": name == null ? null : name,
        "birthday": birthday == null ? null : birthday,
        "occupation": occupation == null
            ? null
            : List<dynamic>.from(occupation!.map((x) => x)),
        "img": img == null ? null : img,
        "status": status == null ? null : status,
        "nickname": nickname == null ? null : nickname,
        "appearance": appearance == null
            ? null
            : List<dynamic>.from(appearance!.map((x) => x)),
        "portrayed": portrayed == null ? null : portrayed,
        "category": category == null ? null : category,
        "better_call_saul_appearance": betterCallSaulAppearance == null
            ? null
            : List<dynamic>.from(betterCallSaulAppearance!.map((x) => x)),
      };
}
