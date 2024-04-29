import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/view_models/favorite_product/favorite_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_favorite/add_to_favorite_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/check_proudct/check_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/delete_from_favorite_cubit/delete_from_favorite_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarProductDetails extends StatelessWidget {
  const CustomAppBarProductDetails({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const GoBackButton(),
            BlocBuilder<CheckProductCubit, CheckProductState>(
              builder: (context, state) {
                if (state is CheckProductSuccess) {
                  return CustomIconButton(
                    onTap: () {
                      generateFav(state, context);
                    },
                    iconName:
                        state.isExist ? kFavoriteIconActive : kFavoriteIcon,
                    color: state.isExist ? Colors.red : Colors.black,
                    padRight: 0,
                  );
                }
                return const CustomLoadingWidget();
              },
            ),
          ],
        ),
      ),
    );
  }

  void generateFav(CheckProductSuccess state, BuildContext context) {
    if (state.isExist) {
      BlocProvider.of<DeleteFromFavoriteCubit>(context)
          .deleteProductFromFavorite(productModel.id!);

      BlocProvider.of<CheckProductCubit>(context)
          .checkProductInFavorite(productModel.id!);
      BlocProvider.of<FavoriteProductCubit>(context).getFavoriteProducts();
    } else {
      BlocProvider.of<AddToFavoriteCubit>(context)
          .addProductToFavorite(productModel.id!);

      BlocProvider.of<CheckProductCubit>(context)
          .checkProductInFavorite(productModel.id!);

      BlocProvider.of<FavoriteProductCubit>(context).getFavoriteProducts();
    }
  }
}
