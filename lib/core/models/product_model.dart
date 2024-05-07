import 'package:ecommerce_app/core/models/image_model.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.sellerId,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.reviewsCount,
    this.rating,
    this.quantityCartItem,
    this.quantityOrderItem,
    this.orderItemStatus,
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? quantity;
  int? quantityCartItem;
  int? quantityOrderItem;
  int? orderItemStatus;
  int? sellerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? reviewsCount;
  double? rating;
  List<ImageModel>? images;

  double devision(double? num1, int? num2) {
    return num1! / num2!;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      quantity: json["quantity"],
      quantityCartItem: json["quantity_cart_item"],
      quantityOrderItem: json["quantity_order_item"],
      sellerId: json["seller_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      images: json["images"] == null
          ? []
          : List<ImageModel>.from(
              json["images"]!.map((x) => ImageModel.fromJson(x))),
      reviewsCount: json['reviews_count'],
      rating: json['reviews_avg_reviewsrating'] == null
          ? 0
          : double.parse(
              json['reviews_avg_reviewsrating'],
            ),
      orderItemStatus: json['order_item_status'],
    );
  }
}
// 'name','description','price','quantity','seller_id'