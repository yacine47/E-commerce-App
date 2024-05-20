import 'package:ecommerce_app/core/functions/get_price_format.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo_impl.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/delete_product_cubit/delete_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/edit_product_view.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_confirm_alert_dialog.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_delete_product_button.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_edit_product_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SellerProductItem extends StatelessWidget {
  const SellerProductItem({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .162,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 10,
            color: Color.fromARGB(20, 0, 0, 0),
            offset: Offset(2.0, 4.0),
            blurStyle: BlurStyle.normal),
      ]),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              12), // Specify the desired border radius here
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: Row(
          children: [
            AspectRatio(
              // aspectRatio: 180 / 143,
              aspectRatio: 180 / 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedNetworkImage(path: product.images![0].path!),
                // child: CustomCachedNetworkImage(
                //     path: productModel.images![0].path!),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(),
                  const SizedBox(),
                  const SizedBox(),
                  Text(
                    product.name ?? 'azerty',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.style16.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product ID : ${getPriceFormat(product.id!)}',
                        style: Styles.style12.copyWith(
                          color: MyColors.hintColorTextField,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const SizedBox(height: 2),
                      Text(
                        'Price : ${getPriceFormat(product.price!)} DA',
                        style: Styles.style12.copyWith(
                          color: MyColors.hintColorTextField,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // const SizedBox(height: 2),
                      Text(
                        'Stack : ${getPriceFormat(product.quantity!)}',
                        style: Styles.style12.copyWith(
                          color: MyColors.hintColorTextField,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomEditProductButton(
                        onTap: () => GoRouter.of(context)
                            .push(EditProductView.path, extra: product),
                      ),
                      const SizedBox(width: 12),
                      CustomDeleteProductButton(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider(
                                  create: (context) => DeleteProductCubit(
                                      getIt.get<ProductRepoImpl>()),
                                  child: CustomConfirmAlertDialog(
                                    idProduct: product.id!,
                                  ),
                                );
                              });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}


// deleteProduct