import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 26,
        width: 26,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: MyColors.primaryColor,
        ),
      ),
    );
  }
}
