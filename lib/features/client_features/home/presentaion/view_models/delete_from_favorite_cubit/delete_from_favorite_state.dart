part of 'delete_from_favorite_cubit.dart';

@immutable
abstract class DeleteFromFavoriteState {}

class DeleteFromFavoriteInitial extends DeleteFromFavoriteState {}

class DeleteFromFavoriteFailure extends DeleteFromFavoriteState {
  final String errMessage;

  DeleteFromFavoriteFailure(this.errMessage);
}

class DeleteFromFavoriteSuccess extends DeleteFromFavoriteState {
  final String successMessage;

  DeleteFromFavoriteSuccess(this.successMessage);
}

class DeleteFromFavoriteLoading extends DeleteFromFavoriteState {}
