import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/quantity_cart_item_cubit/quantity_cart_item_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/counter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterProductCart extends StatelessWidget {
  const CounterProductCart({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterItem(
          onTap: () {
            if (productModel.quantityCartItem! > 1) {
              productModel.quantityCartItem!;
              BlocProvider.of<QuantityCartItemCubit>(context)
                  .updateQuantityCartItem(
                      productModel.id!, productModel.quantityCartItem! - 1);

              BlocProvider.of<ProductCartCubit>(context).getProductCart();
            }
          },
          backgroundColor: MyColors.hintColorTextField,
          iconify: kRemoveIcon,
        ),
        const SizedBox(width: 16),
        Text('${productModel.quantityCartItem!}',
            style: Styles.style14
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(width: 16),
        CounterItem(
          onTap: () {
            BlocProvider.of<QuantityCartItemCubit>(context)
                .updateQuantityCartItem(
                    productModel.id!, productModel.quantityCartItem! + 1);

            BlocProvider.of<ProductCartCubit>(context).getProductCart();
          },
          backgroundColor: MyColors.primaryColor2,
          iconify: kAddIcon,
        ),
      ],
    );
  }
}
