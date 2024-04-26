import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_product_state.dart';

class SearchProductCubit extends Cubit<SearchProductState> {
  SearchProductCubit(
    this.searchRepo,
  ) : super(SearchProductInitial());

  final SearchRepo searchRepo;

  late String search;

  Future<void> searchProduct() async {
    emit(SearchProductLoading());
    var result = await searchRepo.searchProduct(search);

    result.fold(
      (failure) => emit(SearchProductFailure(failure.error)),
      (products) => emit(SearchProductSuccess(products)),
    );
  }
}
