class OrderModel {
  OrderModel({
    this.clientId,
    this.addressId,
    this.supplement,
    this.totalPrice,
    this.couponId,
    this.coupon,
    this.id,
  });

  String? coupon;
  int? couponId;
  int? clientId;
  int? addressId;
  String? supplement;
  int? totalPrice;
  int? id;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      couponId: json["coupon_id"],
      clientId: json["client_id"],
      addressId: json["address_id"] is String ? int.parse(json["address_id"]): json["address_id"],
      supplement: json["supplement"],
      totalPrice: json["total_price"] is String ? int.parse(json["total_price"]): json["total_price"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "coupon": coupon,
        "address_id": addressId,
        "supplement": supplement,
        "total_price": totalPrice,
      };
}
