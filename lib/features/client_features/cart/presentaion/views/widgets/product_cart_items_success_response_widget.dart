import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/checkout_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductCartSuccessResponseWidget extends StatelessWidget {
  const ProductCartSuccessResponseWidget({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? Expanded(
            child: Column(
              children: [
                CartItemsListView(
                  products: products,
                ),
                const SizedBox(height: 16),
                TotalPriceCart(products: products),
                const SizedBox(height: 16),
                ItemHasPadding(
                  horPadding: kHorPadding,
                  child: CustomButtonSubmit(
                    title: 'Checkout',
                    onPressed: () {
                      BlocProvider.of<ProductCartCubit>(context)
                          .getProductCart();
                      GoRouter.of(context).push(
                        CheckoutView.path,
                        extra: products,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
        : Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  // child: AspectRatio(
                  // aspectRatio: 1 / 2,
                  child: Image.asset(MyAssets.cartEmpty),
                  // ),
                ),
                Text(
                  'Your Cart is Empty',
                  style: Styles.style24.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                ItemHasPadding(
                  verPadding: 8,
                  horPadding: MediaQuery.of(context).size.width * .16,
                  child: Text(
                    'Looks like toy haven’t added anyitems to you cart yet',
                    textAlign: TextAlign.center,
                    style: Styles.style16.copyWith(
                      color: MyColors.hintColorTextField,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          );
  }
}
