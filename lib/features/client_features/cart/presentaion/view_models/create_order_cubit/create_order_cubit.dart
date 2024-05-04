import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/order_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'create_order_state.dart';

class CreateOrderCubit extends Cubit<CreateOrderState> {
  CreateOrderCubit(this.cartRepo) : super(CreateOrderInitial());

  String coupon = '0000';
  late String addressId;
  String supplement = '';
  late int totalPrice;

  final CartRepo cartRepo;
  Future<void> createNewOrder() async {
    emit(CreateOrderLoading());

    var result = await cartRepo.createNewOrder(
      OrderModel(
        coupon: coupon,
        addressId:
            addressId is String ? int.parse(addressId) : addressId as int,
        supplement: supplement,
        totalPrice: totalPrice,
      ).toJson(),
    );

    result.fold((failure) => emit(CreateOrderFailure(failure.error)),
        (address) {
      emit(CreateOrderSuccess(address));
    });
  }
}
