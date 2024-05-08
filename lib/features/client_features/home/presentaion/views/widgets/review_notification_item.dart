


import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class ReviewNotificationItem extends StatelessWidget {
  const ReviewNotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)),
        elevation: 0,
        color: MyColors.gapColor,
        child: ItemHasPadding(
          horPadding: 16,
          verPadding: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leave a Quick Review!',
                    style: Styles.style16.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text('08/04/2024',
                      style: Styles.style12.copyWith(
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      MyAssets.product,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    // child: CustomCachedNetworkImage(
                    //     path: productModel.images![0].path!),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Share your experience by leaving a quick review and comment.\nYour feedback helps us improve!',
                            style: Styles.style12,
                            overflow: TextOverflow.clip),
                        const SizedBox(height: 6),
                        Text(
                          'Add Review',
                          style: Styles.style14.copyWith(
                            color: MyColors.primaryColor2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
