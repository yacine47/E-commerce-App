import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_store_seller_profile.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_store_fetch_data.dart';
import 'package:flutter/material.dart';

class StoreSellerViewBody extends StatelessWidget {
  const StoreSellerViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomStoreSellerProfile(),
              const SizedBox(height: 28),
              ItemHasPadding(
                horPadding: kHorPadding,
                child: Text(
                  'Products',
                  style: Styles.style16.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(height: 29),
            ],
          ),
        ),
        const ProductStoreFetchData()
      ],
    );
  }
}
