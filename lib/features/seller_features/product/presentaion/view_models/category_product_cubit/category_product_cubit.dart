import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  CategoryProductCubit(this.productRepo) : super(CategoryProductInitial());

  final ProductRepo productRepo;

  Future<void> getCategoryProduct(int idProduct) async {
    emit(CategoryProductLoading());
    var result = await productRepo.getCategoryProduct(idProduct);

    result.fold(
      (failure) => emit(CategoryProductFailure(failure.error)),
      (categories) => emit(CategoryProductSuccess(categories)),
    );
  }
}
