import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GoRouter.of(context).canPop() ? const GoBackButton() : const SizedBox(),
        Text(
          title,
          style: Styles.style24,
          textAlign: TextAlign.center,
        ),
        const SizedBox(),
      ],
    );
  }
}
