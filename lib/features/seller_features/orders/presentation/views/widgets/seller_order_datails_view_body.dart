import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/functions/order_item_status_string.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/models/order_item_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/repos/order_seller_repo_impl.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/update_order_cubit/update_order_cubit.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/custom_confirm_alert_dialog_update_order.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerOrderDetailsViewBody extends StatelessWidget {
  const SellerOrderDetailsViewBody({super.key, required this.orderItemModel});
  final OrderItemModel orderItemModel;
  
  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 23),
                const CustomAppBar(
                  title: 'Order Details',
                ),
                const SizedBox(height: 26),
                const Spacer(),
                ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Center(
                    child: CustomStepper(
                        currectSetup: orderItemModel.orderItemStatus),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
          orderItemModel.orderItemStatus < 3
              ? CustomButtonSubmit(
                  title:
                      'On ${getOrderItemStatusString(orderItemModel.orderItemStatus + 1)}',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            UpdateOrderCubit(getIt.get<OrderSellerRepoImpl>()),
                        child: CustomConfirmAlertDialogUploadOrder(
                            idOrder: orderItemModel.orderItemId),
                      ),
                    );
                  },
                )
              : const SizedBox(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          )
        ],
      ),
    );
  }
}
