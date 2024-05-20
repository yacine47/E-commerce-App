part of 'add_coupon_cubit.dart';

@immutable
abstract class AddCouponState {}

class AddCouponInitial extends AddCouponState {}

class AddCouponLoading extends AddCouponState {}

class AddCouponSuccess extends AddCouponState {
  final String successMessage;

  AddCouponSuccess(this.successMessage);
}

class AddCouponFailure extends AddCouponState {
  final String errMessage;

  AddCouponFailure(this.errMessage);
}
