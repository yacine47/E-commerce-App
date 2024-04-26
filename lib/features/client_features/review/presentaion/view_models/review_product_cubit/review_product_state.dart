part of 'review_product_cubit.dart';

@immutable
abstract class ReviewProductState {}

class ReviewProductInitial extends ReviewProductState {}

class ReviewProductLoading extends ReviewProductState {}

class ReviewProductSuccess extends ReviewProductState {
  final List<ReviewModel> reviews;

  ReviewProductSuccess(this.reviews);
}

class ReviewProductFailure extends ReviewProductState {
  final String errMessage;

  ReviewProductFailure(this.errMessage);
}
