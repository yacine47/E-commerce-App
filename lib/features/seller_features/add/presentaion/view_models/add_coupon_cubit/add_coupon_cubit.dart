import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/add/data/repos/add_features_repo.dart';
import 'package:meta/meta.dart';

part 'add_coupon_state.dart';

class AddCouponCubit extends Cubit<AddCouponState> {
  AddCouponCubit(this.addFeaturesRepo) : super(AddCouponInitial());

  final AddFeaturesRepo addFeaturesRepo;

  late List<int> products;
  late double reductionPercentage;
  late String couponCode;

  Future<void> addCoupon() async {
    emit(AddCouponLoading());
    var result = await addFeaturesRepo.addCoupon(
      {
        'reduction_percentage': reductionPercentage,
        'coupon_code': couponCode,
      },
      products,
    );

    result.fold(
      (failure) => emit(AddCouponFailure(failure.error)),
      (success) => emit(AddCouponSuccess(success)),
    );
  }
}
// 