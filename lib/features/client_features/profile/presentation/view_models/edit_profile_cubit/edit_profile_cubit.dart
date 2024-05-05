import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.profileClientRepo) : super(EditProfileInitial());
  final ProfileClientRepo profileClientRepo;
  File? imagePath;
  String firstName = '';
  String lastName = '';
  String pathChar = '';


  Future<void> editProfile() async {
    emit(EditProfileLoading());
    
      var result = await profileClientRepo.editProfile(
          imagePath,
          UserModel(
            firstName: firstName,
            lastName: lastName,
            photoProfile: pathChar,
          ));
      result.fold(
          (failure) => emit(
                EditProfileFailure(failure.error),
              ), (success) {
        emit(EditProfileSuccess());
      });
    }
  
}
