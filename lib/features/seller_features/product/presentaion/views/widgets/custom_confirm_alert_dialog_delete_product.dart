import 'package:ecommerce_app/features/seller_features/home/presentation/view_models/product_seller_cubit/product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/delete_product_cubit/delete_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomConfirmAlertDialogDeleteProduct extends StatelessWidget {
  const CustomConfirmAlertDialogDeleteProduct({
    super.key,
    required this.idProduct,
  });
  final int idProduct;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Action'),
      content: const Text(
          'Are you sure you want to delete this product? This action cannot be undone.'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        BlocListener<DeleteProductCubit, DeleteProductState>(
          listener: (context, state) {
            if (state is DeleteProductSuccess ||
                state is DeleteProductFailure) {
              GoRouter.of(context).pop();
              BlocProvider.of<ProductSellerCubit>(context).getProductOfSeller();
            }
          },
          child: TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              BlocProvider.of<DeleteProductCubit>(context)
                  .deleteProduct(idProduct);
            },
          ),
        ),
      ],
    );
  }
}
