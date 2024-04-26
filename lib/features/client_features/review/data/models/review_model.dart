class ReviewModel {
  ReviewModel({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.clientId,
    this.productId,
    this.rating,
    this.comment,
  });

  int? id;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? clientId;
  int? productId;
  String? rating;
  String? comment;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json["id"],
      userId: json["user_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      clientId: json["client_id"],
      productId: json["product_id"],
      rating: json["rating"],
      comment: json["comment"],
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
