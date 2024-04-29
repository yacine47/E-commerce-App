import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'delete_from_favorite_state.dart';

class DeleteFromFavoriteCubit extends Cubit<DeleteFromFavoriteState> {
  DeleteFromFavoriteCubit(this.homeClientRepo)
      : super(DeleteFromFavoriteInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> deleteProductFromFavorite(int idProduct) async {
    emit(DeleteFromFavoriteLoading());
    var result = await homeClientRepo.deleteProductFromFavorite(idProduct);
    result.fold(
      (failure) => emit(DeleteFromFavoriteFailure(failure.error)),
      (success) => emit(DeleteFromFavoriteSuccess(success)),
    );
  }
}
