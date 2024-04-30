


import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckoutGap extends StatelessWidget {
  const CustomCheckoutGap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.gapColor,
      height: 10,
      width: MediaQuery.of(context).size.width,
    );
  }
}
