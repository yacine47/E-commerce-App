import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/counter_item.dart';
import 'package:flutter/material.dart';

class CounterProductCheckout extends StatefulWidget {
  const CounterProductCheckout({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  State<CounterProductCheckout> createState() => _CounterProductCheckoutState();
}

class _CounterProductCheckoutState extends State<CounterProductCheckout> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterItem(
          onTap: () {
            // if (widget.productModel.quantityCartItem! > 1) {
            //   widget.productModel.quantityCartItem!;
            //   BlocProvider.of<QuantityCartItemCubit>(context)
            //       .updateQuantityCartItem(widget.productModel.id!,
            //           widget.productModel.quantityCartItem! - 1);

            //   BlocProvider.of<ProductCartCubit>(context).getProductCart();
            // }
            if (counter > 1) {
              counter--;
            }
          },
          backgroundColor: MyColors.hintColorTextField,
          iconify: kRemoveIcon,
        ),
        const SizedBox(width: 16),
        Text('${widget.productModel.quantityCartItem!}',
            style: Styles.style14
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(width: 16),
        CounterItem(
          onTap: () {
            //   BlocProvider.of<QuantityCartItemCubit>(context)
            //       .updateQuantityCartItem(widget.productModel.id!,
            //           widget.productModel.quantityCartItem! + 1);

            //   BlocProvider.of<ProductCartCubit>(context).getProductCart();

            counter++;
          },
          backgroundColor: MyColors.primaryColor2,
          iconify: kAddIcon,
        ),
      ],
    );
  }
}
