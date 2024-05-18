import 'package:ecommerce_app/features/seller_features/home/presentation/view_models/product_seller_cubit/product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/seller_product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProductView extends StatefulWidget {
  const SellerProductView({super.key});

  static String path = '/SellerProductView';

  @override
  State<SellerProductView> createState() => _SellerProductViewState();
}

class _SellerProductViewState extends State<SellerProductView> {
  @override
  void initState() {
    BlocProvider.of<ProductSellerCubit>(context).getProductOfSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SellerProductViewBody(),
      ),
    );
  }
}
