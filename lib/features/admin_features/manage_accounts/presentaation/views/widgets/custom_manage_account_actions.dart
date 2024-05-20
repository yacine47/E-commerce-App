import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/custom_delete_account_button.dart';
import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/custom_edit_account_button.dart';
import 'package:flutter/material.dart';

class CustomManageAccountActions extends StatelessWidget {
  const CustomManageAccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const SizedBox(width: 4),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: CustomEditAccountButton(
            onTap: () {},
          ),
        ),
        const SizedBox(width: 8),

        Row(
          children: [
            CustomDeleteAccountButton(
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(width: 12),
        // const SizedBox(width: 4),
      ],
    );
  }
}
