part of 'coupon_cart_cubit.dart';

@immutable
abstract class CouponCartState {}

class CouponCartInitial extends CouponCartState {}

class CouponCartLoading extends CouponCartState {}

class CouponCartSuccess extends CouponCartState {
  final CouponCartModel couponCartModel;

  CouponCartSuccess(this.couponCartModel);
}

class CouponCartFailure extends CouponCartState {
  final String errMessage;

  CouponCartFailure(this.errMessage);
}
