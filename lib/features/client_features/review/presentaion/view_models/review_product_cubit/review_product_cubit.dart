import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/review/data/models/review_model.dart';
import 'package:ecommerce_app/features/client_features/review/data/repos/review_repo.dart';
import 'package:meta/meta.dart';

part 'review_product_state.dart';

class ReviewProductCubit extends Cubit<ReviewProductState> {
  ReviewProductCubit(this.reviewRepo) : super(ReviewProductInitial());

  late int idProduct;
  final ReviewRepo reviewRepo;

  Future<void> getFavoriteProducts() async {
    emit(ReviewProductLoading());
    var result = await reviewRepo.getReviewsProduct(idProduct);

    result.fold(
      (failure) => emit(ReviewProductFailure(failure.error)),
      (categories) => emit(ReviewProductSuccess(categories)),
    );
  }
}
