class CouponCartModel {
  final int totalPrice;
  final String couponCode;

  CouponCartModel({required this.totalPrice, required this.couponCode});

  factory CouponCartModel.fromJson(Map<String, dynamic> data) {
    return CouponCartModel(
      totalPrice: data['total_price'] is int ?  data['total_price']:data['total_price'].toInt(),
      couponCode: data['coupon_code'],
    );
  }
}
