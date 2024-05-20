import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit(this.productRepo) : super(DeleteProductInitial());

  
  final ProductRepo productRepo;

  Future<void> deleteProduct(int idProduct) async {
    emit(DeleteProductLoading());
    var result = await productRepo.deleteProduct(idProduct);

    result.fold(
      (failure) => emit(DeleteProductFailure(failure.error)),
      (success) => emit(DeleteProductSuccess(success)),
    );
  }
}
