import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextManageAccount extends StatelessWidget {
  const CustomTextManageAccount({
    super.key,
    required this.title,
    this.flex = 1,
  });

  final String title;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: Styles.style14.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
