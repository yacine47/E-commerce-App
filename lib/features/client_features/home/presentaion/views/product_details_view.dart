import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/cart_view.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ProductDetailsView extends StatelessWidget {
  static String path = '/ProductDetailsView';
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).push(CartView.path);
        },
        backgroundColor: Colors.white,
        child: const Iconify(
          kCartIconify,
        ),
      ),
      body: SafeArea(
        child: ProductDetailsViewBody(
          productModel: productModel,
        ),
      ),
    );
  }
}
