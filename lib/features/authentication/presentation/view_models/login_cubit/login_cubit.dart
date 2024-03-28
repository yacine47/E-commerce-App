import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo, this.userModel) : super(LoginInitial());

  final AuthRepo authRepo;
  final  UserModel userModel;

  Future<void> login() async {
    emit(LoginLoading());
    var result = await authRepo.login({
      'email': userModel.email,
      'password': userModel.password,
    });

    result.fold(
        (failure) => emit(
              LoginFailure(failure.error),
            ),
        (token) => emit(
              LoginSuccess(),
            ));
  }
}
