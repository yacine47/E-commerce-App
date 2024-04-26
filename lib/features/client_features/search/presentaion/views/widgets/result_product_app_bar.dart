import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/search_product_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ResultProductAppBar extends StatelessWidget {
  const ResultProductAppBar({super.key, required this.search});
  final String search;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacement(SearchProductView.path);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          color: MyColors.textFieldColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              IconlyLight.search,
              size: 24,
              color: Color(0xffCFCFCF),
            ),
            const SizedBox(width: 12),
            Text(
              search,
              style: Styles.style16
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
