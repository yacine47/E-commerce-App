import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class SearchProductViewBody extends StatelessWidget {
  const SearchProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomTextFromField(
                  autofocus: true,
                  borderColor: Colors.black.withOpacity(0.2),
                  hint: 'Search Product',
                  prefixIcon: IconlyLight.search,
                  borderRaduis: 16,
                  contentPadding: const EdgeInsets.only(
                      bottom: 14, top: 14, left: 18, right: 18),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Text('Cancel',
                    style: Styles.style16
                        .copyWith(color: MyColors.hintColorTextField)),
              )
            ],
          )
        ],
      ),
    );
  }
}
