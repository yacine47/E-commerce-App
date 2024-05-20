import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/add/data/repos/add_features_repo.dart';
import 'package:meta/meta.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

part 'get_product_seller_state.dart';

class GetProductSellerCubit extends Cubit<GetProductSellerState> {
  GetProductSellerCubit(this.addFeaturesRepo) : super(GetProductSellerInitial());

  final AddFeaturesRepo addFeaturesRepo;


  Future<void> getProductsSeller() async {
    emit(GetProductSellerLoading());
    var result = await addFeaturesRepo.getProductsSeller();

    result.fold(
      (failure) => emit(GetProductSellerFailure(failure.error)),
      (products) => emit(GetProductSellerSuccess(products)),
    );
  }
}
