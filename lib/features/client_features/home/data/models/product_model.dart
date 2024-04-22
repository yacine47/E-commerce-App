import 'package:ecommerce_app/features/client_features/home/data/models/image_model.dart';

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
  });

  int? id;
  String? name;
  String? description;
  int? price;
  int? quantity;
  int? sellerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ImageModel>? images;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      quantity: json["quantity"],
      sellerId: json["seller_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      images: json["images"] == null
          ? []
          : List<ImageModel>.from(
              json["images"]!.map((x) => ImageModel.fromJson(x))),
    );
  }
}
// 'name','description','price','quantity','seller_id'