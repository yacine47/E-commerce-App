import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  GetOrdersCubit(this.profileClientRepo) : super(GetOrdersInitial());

  final ProfileClientRepo profileClientRepo;

  Future<void> getOrders(int index) async {
    emit(GetOrdersLoading());
    var result = await profileClientRepo.getOrders(index);

    result.fold(
      (failure) => emit(GetOrdersFailure(failure.error)),
      (orders) => emit(GetOrdersSuccess(orders)),
    );
  }
}
