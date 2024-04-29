import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'delete_from_cart_state.dart';

class DeleteFromCartCubit extends Cubit<DeleteFromCartState> {
  DeleteFromCartCubit(this.cartRepo) : super(DeleteFromCartInitial());

  final CartRepo cartRepo;

  Future<void> deleteProductFromFavorite(int idProduct) async {
    emit(DeleteFromCartLoading());
    var result = await cartRepo.deleteProductFromCart(idProduct);
    result.fold(
      (failure) => emit(DeleteFromCartFailure(failure.error)),
      (success) => emit(DeleteFromCartSuccess(success)),
    );
  }
}
