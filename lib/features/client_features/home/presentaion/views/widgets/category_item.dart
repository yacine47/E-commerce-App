import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.name, this.isActive = false, this.onTap});

  final String name;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: 96,
        constraints: const BoxConstraints(
          minWidth: 96,
        ),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isActive ? MyColors.primaryColor : MyColors.borderCategoryColor,
          ),
          borderRadius: BorderRadius.circular(8),
          color: isActive ? MyColors.primaryColor : Colors.white,
        ),
        child: Center(
          child: Text(
            name,
            style: Styles.style12.copyWith(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
