import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'check_product_state.dart';

class CheckProductCubit extends Cubit<CheckProductState> {
  CheckProductCubit(this.homeClientRepo) : super(CheckProductInitial());

  final HomeClientRepo homeClientRepo;
  bool isExist = false;

  Future<void> checkProductInFavorite(int idProduct) async {
    emit(CheckProductLoading());
    var result = await homeClientRepo.checkProductInFavorite(idProduct);
    result.fold(
      (failure) => emit(CheckProductFailure(failure.error)),
      (isExistValue) {
        emit(CheckProductSuccess(isExistValue));
      },
    );
  }
}
