import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/seller_add_features_view_body.dart';
import 'package:flutter/material.dart';

class SellerAddFeaturesView extends StatelessWidget {
  const SellerAddFeaturesView({super.key});

  static String path = '/SellerAddFeaturesView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SellerAddFeaturesViewBody(),
      ),
    );
  }
}
