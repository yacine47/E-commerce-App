import 'package:ecommerce_app/core/functions/get_price_format.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.onTap, required this.productModel});
  final void Function()? onTap;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  12) // Specify the desired border radius here
              ),
          elevation: 0,
          shadowColor: Colors.transparent,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 180 / 143,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomCachedNetworkImage(
                      path: productModel.images![0].path!),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productModel.name!,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style14.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500),
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
                            '${productModel.rating!.toStringAsFixed(1)} (${productModel.reviewsCount})',
                            style: Styles.style12
                                .copyWith(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Text(
                        '${getPriceFormat(productModel.price!)} DA',
                        style: Styles.style16.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
