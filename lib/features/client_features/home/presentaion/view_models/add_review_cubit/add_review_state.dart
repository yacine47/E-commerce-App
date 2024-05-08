part of 'add_review_cubit.dart';

@immutable
abstract class AddReviewState {}

class AddReviewInitial extends AddReviewState {}

class AddReviewLoading extends AddReviewState {}

class AddReviewSuccess extends AddReviewState {
  final String successMessage;

  AddReviewSuccess(this.successMessage);
}

class AddReviewFailure extends AddReviewState {
  final String errMessage;

  AddReviewFailure(this.errMessage);
}
