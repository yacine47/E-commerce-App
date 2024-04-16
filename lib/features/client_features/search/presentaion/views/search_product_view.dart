import 'package:ecommerce_app/features/client_features/search/presentaion/views/widgets/search_product_view_body.dart';
import 'package:flutter/material.dart';

class SearchProductView extends StatelessWidget {
  const SearchProductView({super.key});

  static String path = '/SearchProductView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchProductViewBody(),
      ),
    );
  }
}
