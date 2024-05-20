import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/add_coupon_view_body.dart';
import 'package:flutter/material.dart';

class AddCouponView extends StatelessWidget {
  const AddCouponView({super.key});

  static String path = '/AddCouponView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddCouponViewBody(),
      ),
    );
  }
}
