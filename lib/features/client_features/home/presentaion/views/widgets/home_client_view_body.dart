import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/ads_items_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_badge_notification.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_items_home_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/search_product_home_view_body.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/title_items.dart';
import 'package:flutter/material.dart';

class HomeClientViewBody extends StatelessWidget {
  const HomeClientViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ItemHasPadding(
                horPadding: kHorPadding,
                child: Row(
                  children: [
                    Expanded(child: SearchProductHomeViewButton()),
                    SizedBox(width: 16),
                    CustomBadgeNotification(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // ItemHasPadding(
              //     horPadding: kHorPadding,
              //     child: GestureDetector(
              //         onTap: () {
              //           GoRouter.of(context).push(StoreSellerView.path);
              //         },
              //         child: Image.asset(
              //           MyAssets.ads2,
              //         ))),

              AdsItemsFetchData(),
              SizedBox(height: 24),
              CategoryItemsFetchData(),
              SizedBox(height: 26),
              TitleItems(),
              SizedBox(height: 26),
            ],
          ),
        ),
        ProductItemsHomeFetchData(),
      ],
    );
  }
}
