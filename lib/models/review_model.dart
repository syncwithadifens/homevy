// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    required this.code,
    required this.info,
    required this.totalReview,
    required this.data,
  });

  String code;
  String info;
  int totalReview;
  List<Datum> data;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        code: json["code"],
        info: json["info"],
        totalReview: json["total review"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "info": info,
        "total review": totalReview,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.productId,
    required this.userId,
    required this.star,
    required this.review,
    required this.image,
    required this.imagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int productId;
  int userId;
  int star;
  String review;
  String image;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        star: json["star"],
        review: json["review"],
        image: json["image"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "star": star,
        "review": review,
        "image": image,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.handphone,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String handphone;
  DateTime createdAt;
  DateTime updatedAt;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        handphone: json["handphone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "handphone": handphone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "role": role,
      };
}
