part of 'check_product_cubit.dart';

@immutable
abstract class CheckProductState {}

class CheckProductInitial extends CheckProductState {}

class CheckProductLoading extends CheckProductState {}

class CheckProductFailure extends CheckProductState {
  final String errMessage;

  CheckProductFailure(this.errMessage);
}

class CheckProductSuccess extends CheckProductState {
  final bool isExist;

  CheckProductSuccess(this.isExist);
}
