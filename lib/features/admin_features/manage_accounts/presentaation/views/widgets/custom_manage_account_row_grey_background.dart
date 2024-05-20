import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomManageAccountRowGreyBackground extends StatelessWidget {
  const CustomManageAccountRowGreyBackground({
    super.key,
    required this.rowId,
    required this.rowName,
    required this.rowRole,
    required this.rowAction,
  });

  final Widget rowId;
  final Widget rowName;
  final Widget rowRole;
  final Widget rowAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.lighBackgroundColor,
      height: 40,
      child: Row(
        children: [
          Expanded(flex: 1, child: rowId),
          Expanded(flex: 4, child: rowName),
          Expanded(flex: 2, child: rowRole),
          Expanded(flex: 4, child: rowAction),
        ],
      ),
    );
  }
}
