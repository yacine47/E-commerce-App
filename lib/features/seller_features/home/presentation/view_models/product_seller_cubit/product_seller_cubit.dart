import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/seller_features/home/data/repos/hmoe_seller_repo.dart';
import 'package:meta/meta.dart';

part 'product_seller_state.dart';

class ProductSellerCubit extends Cubit<ProductSellerState> {
  ProductSellerCubit(this.homeSellerRepo) : super(ProductSellerInitial());

  final HomeSellerRepo homeSellerRepo;

  Future<void> getProductOfSeller() async {
    emit(ProductSellerLoading());
    var result = await homeSellerRepo.getProductOfSeller();
    result.fold((failure) => emit(ProductSellerFailure(failure.error)),
        (products) {
      emit(ProductSellerSuccess(products));
    });
  }
}
