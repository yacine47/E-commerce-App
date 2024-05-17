import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/seller_product_fetch_data.dart';
import 'package:flutter/material.dart';

class SellerProductViewBody extends StatelessWidget {
  const SellerProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 23),
              ItemHasPadding(
                horPadding: kHorPadding,
                child: CustomAppBar(title: 'My Product'),
              ),
              // const SizedBox(height: 54),
              SizedBox(height: 26),
            ],
          ),
        ),
        SellerProductFetchData(),
      ],
    );
  }
}
