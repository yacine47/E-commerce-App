import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomEditProductButton extends StatelessWidget {
  const CustomEditProductButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 26),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.primaryColor2, width: 2),
          borderRadius: BorderRadius.circular(555),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Edit',
            style: Styles.style14.copyWith(
              color: MyColors.primaryColor2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
