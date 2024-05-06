import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/store_seller_view_body.dart';
import 'package:flutter/material.dart';

class StoreSellerView extends StatelessWidget {
  const StoreSellerView({
    super.key,
  });

  static String path = '/StoreSellerView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: StoreSellerViewBody(),
      ),
    );
  }
}
