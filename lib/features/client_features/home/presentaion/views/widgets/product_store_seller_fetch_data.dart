

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_products_grid_view.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/view_models/favorite_product/favorite_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_items_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemsStoreSellerFetchData extends StatelessWidget {
  const ProductItemsStoreSellerFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // ProductByCategoryCubit
      padding: const EdgeInsets.symmetric(
        horizontal: kHorPadding,
      ),
      sliver: BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
        builder: (context, state) {
          if (state is FavoriteProductFailure) {
            return SliverAppBar(
              title: CustomFailureWidget(
                errMessage: state.errMessage,
              ),
              backgroundColor: Colors.white,
            );
          } else if (state is FavoriteProductSuccess) {
            return ProductItemsGridView(
              products: state.products,
            );
          } else {
            return const CustomLoadingProductsGridView();
          }
        },
      ),
    );
  }
}
