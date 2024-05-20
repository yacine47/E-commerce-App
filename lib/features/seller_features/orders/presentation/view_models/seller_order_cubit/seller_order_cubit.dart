import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/repos/order_seller_repo.dart';
import 'package:meta/meta.dart';

part 'seller_order_state.dart';

class SellerOrderCubit extends Cubit<SellerOrderState> {
  SellerOrderCubit(this.profileClientRepo) : super(SellerOrderInitial());


  final OrderSellerRepo profileClientRepo;

  Future<void> getSellerOrders(int index) async {
    emit(SellerOrderLoading());
    var result = await profileClientRepo.getSellerOrders(index);

    result.fold(
      (failure) => emit(SellerOrderFailure(failure.error)),
      (orders) => emit(SellerOrderSuccess(orders)),
    );
  }
}
