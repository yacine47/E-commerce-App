import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_products_grid_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/product_by_category/product_by_category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_items_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemsHomeFetchData extends StatelessWidget {
  const ProductItemsHomeFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // ProductByCategoryCubit
      padding: const EdgeInsets.symmetric(
        horizontal: kHorPadding,
      ),
      sliver: BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
        builder: (context, state) {
          if (state is ProductByCategoryFailure) {
            return SliverAppBar(
              title: CustomFailureWidget(
                errMessage: state.errMessage,
              ),
              backgroundColor: Colors.white,
            );
          } else if (state is ProductByCategorySuccess) {
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

// SliverGrid(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 6,
//           crossAxisSpacing: 0,
//           childAspectRatio: 3 / 4,
//           // childAspectRatio: 3.5 / 4,
//         ),

//         delegate: SliverChildBuilderDelegate(
//           (context, index) => ProductItem(
//             onTap: () => GoRouter.of(context).push(ProductDetailsView.path),
//           ),
//           childCount: 15,
//         ),
//         // itemCount: 10,
//         // itemBuilder: (context, index) => const ProductItem(),
//       ),