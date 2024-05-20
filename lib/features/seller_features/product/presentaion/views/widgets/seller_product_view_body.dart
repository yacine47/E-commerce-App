import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/view_models/product_seller_cubit/product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_app_bar_my_product.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/seller_product_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProductViewBody extends StatefulWidget {
  const SellerProductViewBody({super.key});

  @override
  State<SellerProductViewBody> createState() => _SellerProductViewBodyState();
}

class _SellerProductViewBodyState extends State<SellerProductViewBody> {
  @override
  void initState() {
    BlocProvider.of<ProductSellerCubit>(context).getProductOfSeller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 23),
              ItemHasPadding(
                horPadding: kHorPadding,
                child: CustomAppBarMyProduct(title: 'My Product'),
              ),
              SizedBox(height: 26),
            ],
          ),
        ),
        SellerProductFetchData(),
      ],
    );
  }
}
