import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_items_home_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/search_product_home_view_body.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/title_items.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeClientViewBody extends StatelessWidget {
  const HomeClientViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ItemHasPadding(
                horPadding: kHorPadding,
                child: Row(
                  children: [
                    const Expanded(child: SearchProductHomeViewButton()),
                    const SizedBox(width: 16),
                    Badge(
                      backgroundColor: MyColors.primaryColor,
                      label: const Text('4'),
                      child: const Icon(
                        IconlyLight.notification,
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Image.asset('assets/images/image 50.png')),
              const SizedBox(height: 24),
              const CategoryItemsFetchData(),
              const SizedBox(height: 26),
              const TitleItems(),
              const SizedBox(height: 26),
            ],
          ),
        ),
        const ProductItemsHomeFetchData(),
      ],
    );
  }
}
