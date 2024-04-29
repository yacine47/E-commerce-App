import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.homeClientRepo) : super(AddToCartInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> addProductToCart(int idProduct) async {
    emit(AddToCartLoading());
    var result = await homeClientRepo.addProductToCart(idProduct);
    result.fold(
      (failure) => emit(AddToCartFailure(failure.error)),
      (success) => emit(AddToCartSuccess(success)),
    );
  }
}
