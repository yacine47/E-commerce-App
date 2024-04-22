import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/all_product/all_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/product_details_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductItemsGridView extends StatelessWidget {
  const ProductItemsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorPadding,
        ),
        sliver: BlocBuilder<AllProductCubit, AllProductState>(
          builder: (context, state) {
            if (state is AllProductFailure) {
              return SliverAppBar(
                title: CustomFailureWidget(
                  errMessage: state.errMessage,
                ),
                backgroundColor: Colors.white,
              );
            } else if (state is AllProductSuccess) {
              return SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 0,
                  childAspectRatio: 3 / 4,
                  // childAspectRatio: 3.5 / 4,
                ),

                delegate: SliverChildBuilderDelegate(
                  (context, index) => ProductItem(
                    productModel: state.products[index],
                    onTap: () => GoRouter.of(context).push(
                        ProductDetailsView.path,
                        extra: state.products[index]),
                  ),
                  childCount: state.products.length,
                ),
                // itemCount: 10,
                // itemBuilder: (context, index) => const ProductItem(),
              );
            } else {
              return const SliverAppBar(
                backgroundColor: Colors.white,
                title: CustomLoadingWidget(),
              );
            }
          },
        ));
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