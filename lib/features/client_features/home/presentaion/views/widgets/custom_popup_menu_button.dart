


import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/home_client_view.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  const CustomPopupMenuButton({
    super.key,
    this.onSelected,
  });

  final void Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 0,
      color: Colors.white,
      shape: Border.all(
        color: MyColors.borderCategoryColor,
      ),
      onSelected: onSelected,
      itemBuilder: (BuildContext bc) {
        return [
          PopupMenuItem(
            value: HomeClientView.path,
            child: const Text(
              "Report Product",
            ),
          ),
        ];
      },
    );
  }
}
