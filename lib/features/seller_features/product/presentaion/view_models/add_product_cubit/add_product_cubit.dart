import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.productRepo) : super(AddProductInitial());

  late String name;
  late String description;
  late int price;
  late int quantity;
  List<File> images = [];
  late List<int> categoriesProduct ;

  final ProductRepo productRepo;

  listImagesEmpty(String message) => emit(AddProductImagesEmpty(message));
  Future<void> addNewProduct() async {
    emit(AddProductLoading());
    var result = await productRepo.addNewProduct({
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
    }, images,categoriesProduct);

    result.fold(
      (failure) => emit(AddProductFailure(failure.error)),
      (product) => emit(AddProductSuccess(product)),
    );
  }
}
