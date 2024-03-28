import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => GoRouter.of(context).pop(),
        child: const Icon(IconlyLight.arrow_left, size: 28));
  }
}
