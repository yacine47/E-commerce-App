import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/image_model.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_field_coupon.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_bottom_bar.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_items_list_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_polices.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/custom_checkout_gap.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/custom_shipping_address.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 23),
                ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GoBackButton(),
                      Text(
                        'Cart',
                        style: Styles.style24,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                // const SizedBox(height: 54),
                const SizedBox(height: 20),
                const CustomCheckoutGap(),
                const CustomShippingAddress(),
                const CustomCheckoutGap(),

                CheckoutItemsListView(products: [
                  ProductModel(
                      id: 1,
                      name: 'Iphone 15 pro max',
                      quantity: 150,
                      quantityCartItem: 1,
                      price: 379000,
                      images: [
                        ImageModel(path: '/images/products/10.jpg'),
                      ]),
                  ProductModel(
                      id: 1,
                      name: 'Iphone 15 pro max',
                      quantity: 150,
                      quantityCartItem: 1,
                      price: 379000,
                      images: [
                        ImageModel(path: '/images/products/10.jpg'),
                      ]),
                  ProductModel(
                      id: 1,
                      name: 'Iphone 15 pro max',
                      quantity: 150,
                      quantityCartItem: 1,
                      price: 379000,
                      images: [
                        ImageModel(path: '/images/products/10.jpg'),
                      ]),
                ]),
                const SizedBox(height: 6),
                const CustomCheckoutGap(),
                const SizedBox(height: 10),
                ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Promo Code',
                        style: Styles.style16.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      const CustomTextFieldCoupon(hint: 'Enter promo code here')
                    ],
                  ),
                ),
                const SizedBox(height: 56),
                const CheckoutPolices(),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        const CheckoutBottomBar(),
      ],
    );
  }
}
