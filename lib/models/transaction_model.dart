// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) =>
    TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) =>
    json.encode(data.toJson());

class TransactionModel {
  TransactionModel({
    required this.code,
    required this.info,
    required this.data,
  });

  String code;
  String info;
  List<Datum>? data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        code: json["code"],
        info: json["info"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['info'] = info;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datum {
  Datum({
    required this.id,
    required this.total,
    required this.status,
    required this.alamat,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  int id;
  int total;
  String status;
  String alamat;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> products;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        total: json["total"],
        status: json["status"],
        alamat: json["alamat"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "status": status,
        "alamat": alamat,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.imagePath,
    required this.harga,
    required this.deskripsi,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.pivot,
  });

  int id;
  String name;
  int categoryId;
  String image;
  String imagePath;
  int harga;
  String deskripsi;
  int stock;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  Pivot pivot;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        image: json["image"],
        imagePath: json["image_path"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        stock: json["stock"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "image": image,
        "image_path": imagePath,
        "harga": harga,
        "deskripsi": deskripsi,
        "stock": stock,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  Pivot({
    required this.transactionId,
    required this.productId,
    required this.qty,
  });

  int transactionId;
  int productId;
  int qty;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        transactionId: json["transaction_id"],
        productId: json["product_id"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "product_id": productId,
        "qty": qty,
      };
}
