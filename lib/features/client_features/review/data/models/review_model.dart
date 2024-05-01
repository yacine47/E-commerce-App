import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';

class ReviewModel {
  ReviewModel(
      {this.id,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.clientId,
      this.productId,
      this.rating,
      this.comment,
      this.user});

  int? id;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? clientId;
  int? productId;
  double? rating;
  String? comment;
  UserModel? user;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"],
      userId: json["user_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      clientId: json["client_id"],
      productId: json["product_id"],
      rating: json["rating"] == null ? 0 : double.parse(json['rating']),
      comment: json["comment"],
      user: UserModel.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "client_id": clientId,
        "product_id": productId,
        "rating": rating,
        "comment": comment,
      };
}
