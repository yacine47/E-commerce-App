part of 'add_advertising_cubit.dart';

@immutable
abstract class AddAdvertisingState {}

class AddAdvertisingInitial extends AddAdvertisingState {}

class AddAdvertisingLoading extends AddAdvertisingState {}

class AddAdvertisingSuccess extends AddAdvertisingState {
  final String successMessage;

  AddAdvertisingSuccess(this.successMessage);
}

class AddAdvertisingFailure extends AddAdvertisingState {
  final String errMessage;

  AddAdvertisingFailure(this.errMessage);
}
