import 'package:ecommerce_app/core/functions/get_price_format.dart';
import 'package:ecommerce_app/core/functions/order_item_status_string.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
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
              aspectRatio: 180 / 170,
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
                  Text(
                    product.name ?? 'azerty',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.style16.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${getPriceFormat(product.price!)} DA',
                    style: Styles.style12.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantity : ${product.quantityOrderItem!}',
                          style: Styles.style14.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                        getOrderItemStatusString(product.orderItemStatus!),
                        style: Styles.style16.copyWith(
                          color: MyColors.primaryColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      )
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
