import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/seller_orders_view.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/seller_product_view.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/seller_dashboard_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeSellerViewBody extends StatelessWidget {
  const HomeSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 23),
              ItemHasPadding(
                  horPadding: kHorPadding,
                  child: CustomAppBar(title: 'Seller Center')),
              // const SizedBox(height: 54),
              SizedBox(height: 26)
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 2 / 2.5,
            ),
            delegate: SliverChildListDelegate.fixed([
              const SellerDashboardItem(
                count: 3,
                icon: Icons.local_mall_outlined,
                title: 'Sales',
              ),
              SellerDashboardItem(
                onTap: () => GoRouter.of(context).push(SellerProductView.path),
                count: 4,
                icon: Icons.storefront_outlined,
                title: 'Products',
              ),
              SellerDashboardItem(
                onTap: () => GoRouter.of(context).push(SellerOrderView.path),
                count: 8,
                icon: Icons.description_outlined,
                title: 'Orders',
              ),
            ]),
          ),
        )

        // Image.network(
        //     'http://10.0.2.2:8000/profile_images/users/VVF8iYxHVMBAkNVe8weH6mEuRo8fCUGHWhUWWWh9.jpg'),
      ],
    );
  }
}
