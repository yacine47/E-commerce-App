import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class CustomEditAccountButton extends StatelessWidget {
  const CustomEditAccountButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: 0,
      verPadding: 8,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 26),
          decoration: BoxDecoration(
            border: Border.all(color: MyColors.primaryColor2, width: 2),
            borderRadius: BorderRadius.circular(555),
            color: MyColors.primaryColor2,
          ),
          child: Center(
            child: Text(
              'Edit',
              style: Styles.style12.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
