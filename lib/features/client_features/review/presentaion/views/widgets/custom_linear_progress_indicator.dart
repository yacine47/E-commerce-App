

import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$index',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: LinearProgressIndicator(
            // color: kPrimaryColor,
            value: 1,
            valueColor:  AlwaysStoppedAnimation(MyColors.primaryColor),
            borderRadius: BorderRadius.circular(50),
            backgroundColor: Colors.grey.withOpacity(0.25),
            minHeight: 11,
          ),
        ),
      ],
    );
  }
}
