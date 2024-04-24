import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_by_category_state.dart';

class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit(this.homeClientRepo)
      : super(ProductByCategoryInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> getProductByCategory(int idCategory) async {
    emit(ProductByCategoryLoading());
    var result = await homeClientRepo.getProductByCategory(idCategory);
    result.fold((failure) => emit(ProductByCategoryFailure(failure.error)),
        (products) {
      emit(ProductByCategorySuccess(products));
      debugPrint('The data fetch successflly');
    });
  }
}
