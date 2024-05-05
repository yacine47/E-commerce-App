import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.profileClientRepo) : super(LogoutInitial());

  final ProfileClientRepo profileClientRepo;

  Future<void> logout() async {
    emit(LogoutLoading());
    var result = await profileClientRepo.logout();

    result.fold(
      (failure) => emit(
        LogoutFailure(failure.error),
      ),
      (success) => emit(LogoutSuccess()),
    );
  }
}
