import 'package:ecommerce_app/core/models/product_model.dart';

class NotificationModel {
  NotificationModel({
    this.id,
    this.type,
    this.notifiableId,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.notifiableType,
    this.readAt,
  });

  String? id;
  String? type;
  String? notifiableType;
  int? notifiableId;
  ProductModel? product;
  DateTime? readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      type: json["type"],
      notifiableType: json["type"],
      notifiableId: json["notifiable_id"],
      product: ProductModel.fromJson(json['data']['product']),
      readAt: json["read_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }
}
