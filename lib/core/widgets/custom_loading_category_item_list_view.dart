import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_category_item.dart';
import 'package:flutter/material.dart';

class CustomLoadingCategoryItemListView extends StatelessWidget {
  const CustomLoadingCategoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomLoadingCategoryItem();
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: 5),
    );
  }
}
