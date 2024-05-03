part of 'create_address_cubit.dart';

@immutable
abstract class CreateAddressState {}

class CreateAddressInitial extends CreateAddressState {}

class CreateAddressLoading extends CreateAddressState {}

class CreateAddressSuccess extends CreateAddressState {
  final AddressModel address;

  CreateAddressSuccess(this.address);
}

class CreateAddressFailure extends CreateAddressState {
  final String errMessage;

  CreateAddressFailure(this.errMessage);
}
