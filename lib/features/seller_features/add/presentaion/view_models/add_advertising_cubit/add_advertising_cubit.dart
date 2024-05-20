import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/add/data/repos/add_features_repo.dart';
import 'package:meta/meta.dart';

part 'add_advertising_state.dart';

class AddAdvertisingCubit extends Cubit<AddAdvertisingState> {
  AddAdvertisingCubit(this.addFeaturesRepo) : super(AddAdvertisingInitial());

  final AddFeaturesRepo addFeaturesRepo;

  File? image;

  Future<void> addAdvertising() async {
    emit(AddAdvertisingLoading());
    var result = await addFeaturesRepo.addAdvertising(image);

    result.fold(
      (failure) => emit(AddAdvertisingFailure(failure.error)),
      (success) => emit(AddAdvertisingSuccess(success)),
    );
  }
}
