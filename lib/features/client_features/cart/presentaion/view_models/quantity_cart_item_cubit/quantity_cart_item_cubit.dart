import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'quantity_cart_item_state.dart';

class QuantityCartItemCubit extends Cubit<QuantityCartItemState> {
  QuantityCartItemCubit(this.cartRepo) : super(QuantityCartItemInitial());

  final CartRepo cartRepo;

  Future<void> updateQuantityCartItem(int idProduct,int counter) async {
    emit(QuantityCartItemLoading());
    var result = await cartRepo.updateQuantityCartItem(idProduct,counter);
    result.fold(
      (failure) => emit(QuantityCartItemFailure(failure.error)),
      (success) => emit(QuantityCartItemSuccess(success)),
    );
  }
}
