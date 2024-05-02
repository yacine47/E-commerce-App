class CouponCartModel {
  final double totalPrice;
  final String couponCode;

  CouponCartModel({required this.totalPrice, required this.couponCode});

  factory CouponCartModel.fromJson(Map<String, dynamic> data) {
    return CouponCartModel(
      totalPrice: data['total_price'],
      couponCode: data['coupon_code'],
    );
  }
}
