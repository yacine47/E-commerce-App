import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchProductHomeViewButton extends StatelessWidget {
  const SearchProductHomeViewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black.withOpacity(0.2)),
            color: MyColors.textFieldColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                IconlyLight.search,
                size: 24,
                color: Color(0xffCFCFCF),
              ),
              const SizedBox(width: 12),
              Text(
                'Search Product ...',
                style:
                    Styles.style16.copyWith(color: MyColors.hintColorTextField),
              )
            ],
          ),
        ),
      ),
    );
  }
}
