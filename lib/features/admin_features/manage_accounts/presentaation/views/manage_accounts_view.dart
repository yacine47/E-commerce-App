import 'package:ecommerce_app/features/admin_features/manage_accounts/presentaation/views/widgets/manage_accounts_view_body.dart';
import 'package:flutter/material.dart';

class ManageAccountsView extends StatelessWidget {
  const ManageAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ManageAccountsViewBody(),
      ),
    );
  }
}
