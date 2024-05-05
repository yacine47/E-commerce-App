


import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_field_coupon.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/coupon_cart_cubit/coupon_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_order_cubit/create_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
