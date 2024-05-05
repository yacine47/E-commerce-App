part of 'user_information_cubit.dart';

@immutable
abstract class UserInformationState {}

class UserInformationInitial extends UserInformationState {}

class UserInformationLoading extends UserInformationState {}

class UserInformationSuccess extends UserInformationState {
  final UserModel userModel;

  UserInformationSuccess(this.userModel);
}

class UserInformationFailure extends UserInformationState {
  final String errMessage;

  UserInformationFailure(this.errMessage);
}
