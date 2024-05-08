import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';
import 'package:meta/meta.dart';

part 'all_order_item_delivred_count_state.dart';

class AllOrderItemDelivredCountCubit
    extends Cubit<AllOrderItemDelivredCountState> {
  AllOrderItemDelivredCountCubit(this.homeClientRepo)
      : super(AllOrderItemDelivredCountInitial());

  final HomeClientRepo homeClientRepo;

  Future<void> getAllOrderItemDelivredCount() async {
    emit(AllOrderItemDelivredCountLoading());
    var result = await homeClientRepo.getAllOrderItemDelivredCount();

    result.fold(
      (failure) => emit(AllOrderItemDelivredCountFailure(failure.error)),
      (advertisings) => emit(AllOrderItemDelivredCountSuccess(advertisings)),
    );
  }
}
