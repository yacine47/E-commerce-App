import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/coupon_cart_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'coupon_cart_state.dart';

class CouponCartCubit extends Cubit<CouponCartState> {
  CouponCartCubit(this.cartRepo) : super(CouponCartInitial());

  final CartRepo cartRepo;
  late String coupon;
  Future<void> couponCart(String coupon) async {
    emit(CouponCartLoading());
    var result = await cartRepo.couponCart(coupon);

    result.fold(
      (failure) => emit(CouponCartFailure(failure.error)),
      (couponCart) {
        emit(CouponCartSuccess(couponCart));
      },
    );
  }
}
