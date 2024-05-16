import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/seller_dashbord_item.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeSellerViewBody extends StatelessWidget {
  const HomeSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 23),
              ItemHasPadding(
                  horPadding: kHorPadding,
                  child: CustomAppBar(title: 'Seller Dashbord')),
              // const SizedBox(height: 54),
              SizedBox(height: 26)
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: kHorPadding),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 2 / 2.5,
            ),
            delegate: SliverChildListDelegate.fixed([
              SellerDashbordItem(
                count: 15,
                icon: Icons.local_mall_outlined,
                title: 'Sales',
              ),
              SellerDashbordItem(
                count: 15,
                icon: Icons.inventory_2_outlined,
                title: 'Sales',
              ),
              SellerDashbordItem(
                count: 15,
                icon: Icons.description_outlined,
                title: 'Sales',
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
