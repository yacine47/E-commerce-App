import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/home_seller_view_body.dart';
import 'package:flutter/material.dart';

class HomeSellerView extends StatelessWidget {
  const HomeSellerView({super.key});
  static String path = '/HomeSellerView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeSellerViewBody()),
    );
  }
}
