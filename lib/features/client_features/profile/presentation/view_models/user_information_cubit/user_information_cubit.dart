
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo.dart';
import 'package:meta/meta.dart';

part 'user_information_state.dart';

class UserInformationCubit extends Cubit<UserInformationState> {
  UserInformationCubit(this.profileClientRepo)
      : super(UserInformationInitial());

  final ProfileClientRepo profileClientRepo;

 
  
  Future<void> getInformationUser() async {
    emit(UserInformationLoading());
    var result = await profileClientRepo.getInformationUser();

    result.fold(
        (failure) => emit(
              UserInformationFailure(failure.error),
            ), (userModel) {
      emit(UserInformationSuccess(userModel));
    });
  }
}
