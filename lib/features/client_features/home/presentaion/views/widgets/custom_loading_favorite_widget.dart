import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomLoadingFavoriteWidget extends StatelessWidget {
  const CustomLoadingFavoriteWidget({super.key, this.color = MyColors.primaryColor});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 26,
        width: 26,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          color: color,
        ),
      ),
    );
  }
}
