import 'package:ecommerce_app/core/models/seller_model.dart';

class AdvertisingModel {
  AdvertisingModel({
    this.id,
    this.coverAdsImage,
    this.sellerId,
    this.createdAt,
    this.updatedAt,
    this.sellerModel,
  });

  int? id;
  String? coverAdsImage;
  int? sellerId;
  SellerModel? sellerModel;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory AdvertisingModel.fromJson(Map<String, dynamic> json) {
    return AdvertisingModel(
      id: json["id"],
      coverAdsImage: json["cover_ads_image"],
      sellerId: json["seller_id"],
      sellerModel:
          json["seller"] == null ? null : SellerModel.fromJson(json["seller"]),
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
