import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_products_grid_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/advertising_deatils_cubit/advertising_details_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_items_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductStoreFetchData extends StatelessWidget {
  const ProductStoreFetchData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // ProductByCategoryCubit
      padding: const EdgeInsets.symmetric(
        horizontal: kHorPadding,
      ),
      sliver: BlocBuilder<AdvertisingDetailsCubit, AdvertisingDetailsState>(
        builder: (context, state) {
          if (state is AdvertisingDetailsFailure) {
            return SliverAppBar(
              title: CustomFailureWidget(
                errMessage: state.errMessage,
              ),
              backgroundColor: Colors.white,
            );
          } else if (state is AdvertisingDetailsSuccess) {
            return ProductItemsGridView(
              products: state.ads.sellerModel!.products!,
            );
          } else {
            return const CustomLoadingProductsGridView();
          }
        },
      ),
    );
  }
}
