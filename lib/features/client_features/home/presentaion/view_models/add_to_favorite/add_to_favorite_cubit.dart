import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'add_to_favorite_state.dart';

class AddToFavoriteCubit extends Cubit<AddToFavoriteState> {
  AddToFavoriteCubit(this.homeClientRepo) : super(AddToFavoriteInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> addProductToFavorite(int idProduct) async {
    emit(AddToFavoriteLoading());
    var result = await homeClientRepo.addProductToFavorite(idProduct);
    result.fold(
      (failure) => emit(AddToFavoriteFailure(failure.error)),
      (success) => emit(AddToFavoriteSuccess(success)),
    );
  }
}
