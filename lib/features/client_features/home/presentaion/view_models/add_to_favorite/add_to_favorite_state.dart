part of 'add_to_favorite_cubit.dart';

@immutable
abstract class AddToFavoriteState {}

class AddToFavoriteInitial extends AddToFavoriteState {}

class AddToFavoriteLoading extends AddToFavoriteState {}

class AddToFavoriteFailure extends AddToFavoriteState {
  final String errMessage;

  AddToFavoriteFailure(this.errMessage);
}

class AddToFavoriteSuccess extends AddToFavoriteState {
  final String successMessage;

  AddToFavoriteSuccess(this.successMessage);
}
