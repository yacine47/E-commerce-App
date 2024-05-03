import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/address_model.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/coupon_cart_cubit/coupon_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_order_cubit/create_order_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/custom_supplement_text_field.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_report_product_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_field_coupon.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/address_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_bottom_bar.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_items_list_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_polices.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/custom_checkout_gap.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/custom_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({
    super.key,
  });

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  AddressModel? addressModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCartCubit, ProductCartState>(
      builder: (context, state) {
        // state is ProductCartSuccess
        if (state is ProductCartSuccess) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 23),
                      const ItemHasPadding(
                        horPadding: kHorPadding,
                        child: CustomAppBar(
                          title: 'Checkout',
                        ),
                      ),
                      // const SizedBox(height: 54),
                      const SizedBox(height: 20),
                      const CustomCheckoutGap(),
                      // addressModel
                      CustomShippingAddress(
                        onTap: () {
                          GoRouter.of(context).push(AddressView.path);
                        },
                      ),
                      const CustomCheckoutGap(),
                      CheckoutItemsListView(products: state.products),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            const FormTextFieldCoupon(),
                            const SizedBox(height: 12),
                            Text(
                              'More information',
                              style: Styles.style16.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 12),
                            CustomSupplementTextField(
                              onChanged: (value) {
                                BlocProvider.of<CreateOrderCubit>(context)
                                    .supplement = value!;
                              },
                              hint: 'Addition',
                              maxLines: 5,
                            ),
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
              CheckoutBottomBar(
                products: state.products,
              ),
            ],
          );
        } else if (state is ProductCartFailure) {
          return CustomFailureWidget(errMessage: state.errMessage);
        }
        return const CustomLoadingWidget();
      },
    );
  }
}

class FormTextFieldCoupon extends StatefulWidget {
  const FormTextFieldCoupon({
    super.key,
  });

  @override
  State<FormTextFieldCoupon> createState() => _FormTextFieldCouponState();
}

class _FormTextFieldCouponState extends State<FormTextFieldCoupon> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? coupon;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFieldCoupon(
          suffixOnTap: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              BlocProvider.of<CouponCartCubit>(context).couponCart(coupon!);
              BlocProvider.of<CreateOrderCubit>(context).coupon = coupon!;
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
          onSaved: (value) {
            coupon = value!;
          },
          hint: 'Enter promo code here'),
    );
  }
}
