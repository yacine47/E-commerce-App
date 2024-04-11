import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/home_seller_view_body.dart';
import 'package:flutter/material.dart';

class HomeSellerView extends StatelessWidget {
  const HomeSellerView({super.key});
  static String path = '/HomeSellerView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {},
      ),
      body: const SafeArea(
        child: HomeSellerViewBody(),
      ),
    );
  }
}
