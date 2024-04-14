import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/product_details_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item_list_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_item.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/search_product_home_view_body.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/title_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              const SearchProductHomeViewButton(),
              const SizedBox(height: 20),
              ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Image.asset('assets/images/image 50.png')),
              const SizedBox(height: 24),
              const CategoryItemListView(),
              const SizedBox(height: 26),
              const TitleItems(),
              const SizedBox(height: 26),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorPadding,
          ),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 0,
              childAspectRatio: 3 / 4,
              // childAspectRatio: 3.5 / 4,
            ),

            delegate: SliverChildBuilderDelegate(
              (context, index) => ProductItem(
                onTap: () => GoRouter.of(context).push(ProductDetailsView.path),
              ),
              childCount: 15,
            ),
            // itemCount: 10,
            // itemBuilder: (context, index) => const ProductItem(),
          ),
        )
      ],
    );
  }
}
