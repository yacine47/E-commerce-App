import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/add_advertising_view.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/add_coupon_view.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/custom_add_features_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SellerAddFeaturesViewBody extends StatelessWidget {
  const SellerAddFeaturesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const CustomAppBar(
            title: 'Add Features',
          ),
          // const SizedBox(height: 54),
          const SizedBox(height: 36),
          CustomAddFeaturesItem(
            onTap: () => GoRouter.of(context).push(AddCouponView.path),
            title: 'Add Coupon',
            color: MyColors.primaryColor2,
            icon: kCouponIcon,
          ),
          const SizedBox(height: 16),
          CustomAddFeaturesItem(
            onTap: () => GoRouter.of(context).push(AddAdvertisingView.path),
            title: 'Add Advertising',
            color: MyColors.primaryColor3,
            icon: kAdsIcon,
          ),
        ],
      ),
    );
  }
}
