class CouponModel {
  // 'reduction_percentage','','','',''
  int? id;
  int? reductionPercentage;
  DateTime? expDate;
  String? couponCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  CouponModel({
    this.id,
    this.couponCode,
    this.expDate,
    this.createdAt,
    this.updatedAt,
    this.reductionPercentage,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json["id"],
      couponCode: json["coupon_code"],
      reductionPercentage: json["reduction_percentage"],
      expDate: DateTime.tryParse(json["exp_date"] ?? ""),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      
    );
  }
}
