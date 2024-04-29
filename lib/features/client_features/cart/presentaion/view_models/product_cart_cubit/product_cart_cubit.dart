import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  ProductCartCubit(this.cartRepo) : super(ProductCartInitial());

  final CartRepo cartRepo;
  late List<ProductModel> cartProducts;
  Future<void> getProductCart() async {
    emit(ProductCartLoading());
    var result = await cartRepo.getProductCart();

    result.fold(
      (failure) => emit(ProductCartFailure(failure.error)),
      (products) {
        cartProducts = products;
        emit(ProductCartSuccess(cartProducts));
      },
    );
  }
}
