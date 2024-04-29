// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/home_client_view.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/product_reviews_view.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/bottom_bar_product_details.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_app_bar_product_details.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_image_slider.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_rate_card.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_read_more_product_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Stack(
                children: [
                  CustomImageSlider(
                    images: productModel.images!,
                  ),
                  Positioned(
                    top: 23,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CustomAppBarProductDetails(
                          productModel: productModel,
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRateCard(
                            onTap: () => GoRouter.of(context).push(
                                  ProductReviewsView.path,
                                  extra: productModel.id,
                                ),
                            productModel: productModel),
                        CustomPopupMenuButton(
                          onSelected: (value) {},
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(productModel.name!, style: Styles.style24),
                    const SizedBox(height: 10),
                    CustomReadMoreProductDetails(
                        text: productModel.description!),
                    const SizedBox(height: 21),
                    // Text('Size', style: Styles.style18),
                    // const Row(
                    //   children: [
                    //     SizedProductItem(hint: 'S'),
                    //     SizedProductItem(hint: 'M'),
                    //     SizedProductItem(hint: 'L'),
                    //     SizedProductItem(hint: 'XL'),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
        BottomBarProductDetails(
            price: productModel.price!,
            onPressed: () {
              BlocProvider.of<AddToCartCubit>(context)
                  .addProductToCart(productModel.id!);
            }),
      ],
    );
  }
}

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    this.onSelected,
  });

  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 0,
      color: Colors.white,
      shape: Border.all(
        color: MyColors.borderCategoryColor,
      ),
      onSelected: (value) {
        GoRouter.of(context).push(value);
      },
      itemBuilder: (BuildContext bc) {
        return [
          PopupMenuItem(
            value: HomeClientView.path,
            child: const Text("Report Product"),
          ),
        ];
      },
    );
  }
}
