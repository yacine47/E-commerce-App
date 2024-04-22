import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.homeClientRepo) : super(AllProductInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> getAllProducts() async {
    emit(AllProductLoading());
    var result = await homeClientRepo.getAllProducts();
    result.fold(
      (failure) => emit(AllProductFailure(failure.error)),
      (products) => emit(AllProductSuccess(products)),
    );
  }
}
