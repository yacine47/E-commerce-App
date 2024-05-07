import 'package:ecommerce_app/core/models/product_model.dart';

class OrderModel {
  OrderModel({
    this.clientId,
    this.addressId,
    this.supplement,
    this.totalPrice,
    this.couponId,
    this.coupon,
    this.id,
    this.products,
    this.createdAt,
    this.updatedAt,
  });

  String? coupon;
  int? couponId;
  int? clientId;
  int? addressId;
  String? supplement;
  int? totalPrice;
  int? id;
  List<ProductModel>? products;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      couponId: json["coupon_id"],
      clientId: json["client_id"],
      addressId: json["address_id"] is String
          ? int.parse(json["address_id"])
          : json["address_id"],
      supplement: json["supplement"],
      totalPrice: json["total_price"] is String
          ? int.parse(json["total_price"])
          : json["total_price"],
      id: json["id"],
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(
              json["products"]!.map((x) => ProductModel.fromJson(x))),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "coupon": coupon,
        "address_id": addressId,
        "supplement": supplement,
        "total_price": totalPrice,
      };
}
