import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';

class SellerModel {
  SellerModel({
    this.id,
    this.coverAdsImage,
    this.sellerId,
    this.userModel,
    this.products,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? coverAdsImage;
  int? sellerId;
  UserModel? userModel;
  List<ProductModel>? products;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SellerModel.fromJson(Map<String, dynamic> json) {
    return SellerModel(
      id: json["id"],
      coverAdsImage: json["cover_ads_image"],
      sellerId: json["seller_id"],
      userModel: UserModel.fromJson(json["user"]),
      products: json["products"] == null
          ? []
          : List<ProductModel>.from(
              json["products"]!.map((x) => ProductModel.fromJson(x))),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "cover_ads_image": coverAdsImage,
        "seller_id": sellerId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
