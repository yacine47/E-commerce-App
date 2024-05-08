import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/notification_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'all_order_item_delivred_state.dart';

class AllOrderItemDelivredCubit extends Cubit<AllOrderItemDelivredState> {
  AllOrderItemDelivredCubit(this.homeClientRepo)
      : super(AllOrderItemDelivredInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> getAllOrderItemDelivred() async {
    emit(AllOrderItemDelivredLoading());
    var result = await homeClientRepo.getAllOrderItemDelivred();

    result.fold(
      (failure) => emit(AllOrderItemDelivredFailure(failure.error)),
      (advertisings) => emit(AllOrderItemDelivredSuccess(advertisings)),
    );
  }
}
