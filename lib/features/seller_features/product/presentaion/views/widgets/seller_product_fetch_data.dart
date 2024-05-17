import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_products_grid_view.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/view_models/product_seller_cubit/product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/product_seller_items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerProductFetchData extends StatelessWidget {
  const SellerProductFetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // ProductByCategoryCubit
      padding: const EdgeInsets.symmetric(
        horizontal: kHorPadding,
      ),
      sliver: BlocBuilder<ProductSellerCubit, ProductSellerState>(
        builder: (context, state) {
          if (state is ProductSellerFailure) {
            return SliverAppBar(
              title: CustomFailureWidget(
                errMessage: state.errMessage,
              ),
              backgroundColor: Colors.white,
            );
          } else if (state is ProductSellerSuccess) {
            return ProductSellerItemsListView(
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
