import 'package:ecommerce_app/core/functions/get_price_format.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AddReviewProductItem extends StatelessWidget {
  const AddReviewProductItem({
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(),
                  Text(
                    product.name ?? 'azerty',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.style16.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        IconlyBold.star,
                        color: MyColors.starColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating!.toStringAsFixed(1)} (${product.reviewsCount})',
                        style: Styles.style12
                            .copyWith(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Text(
                    '${getPriceFormat(product.price!)} DA',
                    style: Styles.style14.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(),
                  // Text('Quantity : ${product.quantityCartItem!}',
                  //     style: Styles.style14.copyWith(
                  //         color: Colors.black, fontWeight: FontWeight.bold)),
                  // const SizedBox(),
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
