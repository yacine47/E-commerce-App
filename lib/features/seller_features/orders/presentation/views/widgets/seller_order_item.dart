import 'package:ecommerce_app/core/functions/order_item_status_string.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/models/order_item_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/seller_order_details_view.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/custom_edit_product_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SellerOrderItem extends StatelessWidget {
  const SellerOrderItem({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .14,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Product ID : ${product.orderItemsId!}',
                        style: Styles.style12.copyWith(
                          color: MyColors.hintColorTextField,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '08/04/2024',
                        style: Styles.style12.copyWith(
                          color: MyColors.hintColorTextField,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? 'azerty',
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style16.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Quantity : ${product.quantityOrderItem!}',
                        style: Styles.style12.copyWith(
                          color: MyColors.hintColorTextField,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getOrderItemStatusString(product.orderItemStatus!),
                        style: Styles.style16.copyWith(
                          color: MyColors.primaryColor3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomEditProductButton(onTap: () {
                       
                        GoRouter.of(context).push(
                          SellerOrderDetailsView.path,
                          extra: OrderItemModel(
                              orderItemId: product.orderItemsId!,
                              orderItemStatus: product.orderItemStatus!),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
