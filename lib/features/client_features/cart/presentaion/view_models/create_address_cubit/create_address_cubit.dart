import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/address_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'create_address_state.dart';

class CreateAddressCubit extends Cubit<CreateAddressState> {
  CreateAddressCubit(this.cartRepo) : super(CreateAddressInitial());

  late String fullName;
  late String stateAddress;
  late String city;
  late String phoneNumber;
  late String addressLine;

  AddressModel? addressModel;

  final CartRepo cartRepo;
  Future<void> createNewAddress() async {
    emit(CreateAddressLoading());
    var result = await cartRepo.createNewAddress(AddressModel(
      addressLine: addressLine,
      city: city,
      fullName: fullName,
      phoneNumber: phoneNumber,
      state: stateAddress,
    ).toJson());

    result.fold((failure) => emit(CreateAddressFailure(failure.error)),
        (address) {
      addressModel = address;
      emit(CreateAddressSuccess(address));
    });
  }
}
