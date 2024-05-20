import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/repos/order_seller_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.orderSellerRepo) : super(UpdateOrderInitial());


    final OrderSellerRepo orderSellerRepo;

  Future<void> updateOrder(int id) async {
    emit(UpdateOrderLoading());
    var result = await orderSellerRepo.updateOrder(id);

    result.fold(
      (failure) => emit(UpdateOrderFailure(failure.error)),
      (orders) => emit(UpdateOrderSuccess(orders)),
    );
  }
}
