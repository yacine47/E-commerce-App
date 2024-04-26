import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/favorite/data/repos/favorite_repo.dart';
import 'package:meta/meta.dart';

part 'favorite_product_state.dart';

class FavoriteProductCubit extends Cubit<FavoriteProductState> {
  FavoriteProductCubit(this.favoriteRepo) : super(FavoriteProductInitial());

  final FavoriteRepo favoriteRepo;

  Future<void> getFavoriteProducts() async {
    emit(FavoriteProductLoading());
    var result = await favoriteRepo.getFavoriteProducts();

    result.fold(
      (failure) => emit(FavoriteProductFailure(failure.error)),
      (categories) => emit(FavoriteProductSuccess(categories)),
    );
  }
}
