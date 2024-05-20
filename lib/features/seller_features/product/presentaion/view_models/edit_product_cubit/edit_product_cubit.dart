import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit(this.productRepo) : super(EditProductInitial());

  final ProductRepo productRepo;

  List<dynamic> images = [];
  late List<int> categoriesProduct;

  listImagesEmpty(String message) => emit(EditProductImagesEmpty(message));

  late String name;
  late String description;
  late int price;
  late int quantity;

  Future<void> editProduct(int idProduct) async {
    emit(EditProductLoading());
    var result = await productRepo.editProduct(
      dataRequest: {
        'name': name,
        'description': description,
        'price': price,
        'quantity': quantity,
      },
      categoriesProduct: categoriesProduct,
      images: images,
      idProduct: idProduct,
    );

    result.fold(
      (failure) => emit(EditProductFailure(failure.error)),
      (product) => emit(EditProductSuccess(product)),
    );
  }
}
