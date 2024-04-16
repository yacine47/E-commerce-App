import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo, this.userModel) : super(RegisterInitial());

  final AuthRepo authRepo;
  final UserModel userModel;

  Future<void> register() async {
    emit(RegisterLoading());
    Map<String, dynamic> data = {
      'first_name': userModel.firstName,
      'last_name': userModel.lastName,
      'email': userModel.email,
      'password': userModel.password,
      'password_confirmation': userModel.passwordConfirmation,
      'role': userModel.role,
    };
    var result = await authRepo.register(data);

    result.fold(
      (failure) => emit(RegisterFailure(failure.error)),
      (success) => emit(RegisterSuccess()),
    );
  }
}
