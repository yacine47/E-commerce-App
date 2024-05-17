import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomDeleteProductButton extends StatelessWidget {
  const CustomDeleteProductButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30, // Set your desired width
        height: 30,
        decoration: BoxDecoration(
          color:
              MyColors.primaryColor, // Set your desired background color here
          borderRadius: BorderRadius.circular(
              555), // Optional: You can adjust the border radius as per your design
        ),
        child: const Icon(
          Icons.delete,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
