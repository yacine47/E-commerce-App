import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_card_item_height.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/custom_manage_account_actions.dart';
import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/custom_manage_account_row_grey_background.dart';
import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/custom_manage_account_row_white_background.dart';
import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/custom_text_manage_account.dart';
import 'package:flutter/material.dart';

class ManageAccountsViewBody extends StatelessWidget {
  const ManageAccountsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ItemHasPadding(
            horPadding: 8,
            child: Column(
              children: [
                const SizedBox(height: 23),
                const CustomAppBar(title: 'Manage Account'),
                const SizedBox(height: 26),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const CustomCardItem(
                    child: Column(
                      children: [
                        CustomManageAccountRowWhiteBackground(
                          rowId: CustomTextManageAccount(title: 'ID'),
                          rowRole: CustomTextManageAccount(title: 'Role'),
                          rowName: CustomTextManageAccount(title: 'Name'),
                          rowAction: SizedBox(),
                        ),
                        CustomManageAccountRowGreyBackground(
                          rowId: CustomTextManageAccount(title: '1'),
                          rowRole: CustomTextManageAccount(title: 'Seller'),
                          rowName:
                              CustomTextManageAccount(title: 'Emma Johnson'),
                          rowAction: CustomManageAccountActions(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
