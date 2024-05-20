import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';
import 'package:meta/meta.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

part 'all_categories_state.dart';

class AllCategoriesCubit extends Cubit<AllCategoriesState> {
  AllCategoriesCubit(this.productRepo) : super(AllCategoriesInitial());

  final ProductRepo productRepo;

  Future<void> getAllCategories() async {
    emit(AllCategoriesLoading());
    var result = await productRepo.getAllCategories();

    result.fold(
      (failure) => emit(AllCategoriesFailure(failure.error)),
      (categories) => emit(AllCategoriesSuccess(categories)),
    );
  }
}
