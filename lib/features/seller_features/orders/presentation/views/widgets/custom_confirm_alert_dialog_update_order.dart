import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/seller_order_cubit/seller_order_cubit.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/update_order_cubit/update_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomConfirmAlertDialogUploadOrder extends StatelessWidget {
  const CustomConfirmAlertDialogUploadOrder({
    super.key,
    required this.idOrder,
  });
  final int idOrder;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Action'),
      content: const Text(
          'Are you sure you want to update this order? This action cannot be undone.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        BlocListener<UpdateOrderCubit, UpdateOrderState>(
          listener: (context, state) {
            if (state is UpdateOrderSuccess || state is UpdateOrderFailure) {
              GoRouter.of(context).pop();
              BlocProvider.of<SellerOrderCubit>(context).getSellerOrders(0);
              BlocProvider.of<SellerOrderCubit>(context).getSellerOrders(1);
              BlocProvider.of<SellerOrderCubit>(context).getSellerOrders(2);
              GoRouter.of(context).pop();
            }
          },
          child: TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              BlocProvider.of<UpdateOrderCubit>(context).updateOrder(idOrder);
            },
          ),
        ),
      ],
    );
  }
}
