import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item_list_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/search_product_home_view_body.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/title_items.dart';
import 'package:flutter/material.dart';

class HomeClientViewBody extends StatelessWidget {
  const HomeClientViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const SearchProductHomeViewButton(),
        const SizedBox(height: 20),
        ItemHasPadding(
            horPadding: kHorPadding,
            child: Image.asset('assets/images/image 50.png')),
        const SizedBox(height: 24),
        const CategoryItemListView(),
        const SizedBox(height: 26),
        const TitleItems(),
      ],
    );
  }
}
