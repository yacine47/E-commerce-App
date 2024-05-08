import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'add_review_state.dart';

class AddReviewCubit extends Cubit<AddReviewState> {
  AddReviewCubit(this.homeClientRepo) : super(AddReviewInitial());

  final HomeClientRepo homeClientRepo;

  late int productId;
  late double rating = 4;
  late String comment;
  late String notificationId;

  Future<void> createReviewProduct() async {
    emit(AddReviewLoading());
    var result = await homeClientRepo.createReviewProduct(
      {
        'product_id': productId,
        'rating': rating,
        'comment': comment,
      },
      {
        'id': notificationId,
      },
    );
    result.fold(
      (failure) => emit(AddReviewFailure(failure.error)),
      (success) => emit(AddReviewSuccess(success)),
    );
  }
}
