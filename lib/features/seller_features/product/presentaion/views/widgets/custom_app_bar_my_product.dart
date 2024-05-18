import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_icon_button.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/add_product_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarMyProduct extends StatelessWidget {
  const CustomAppBarMyProduct({
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
        CustomIconButton(
          iconName: kAddIcon,
          padRight: 0,
          onTap: () => GoRouter.of(context).push(AddProductView.path),
        )
      ],
    );
  }
}
