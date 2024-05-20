import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/admin_features/home/presentation/views/widgets/custom_dashboard_admin_item.dart';
import 'package:flutter/material.dart';

class HomeAdminViewBody extends StatelessWidget {
  const HomeAdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          const SizedBox(height: 23),
          const CustomAppBar(title: 'Dashboard'),
          // const SizedBox(height: 54),
          const SizedBox(height: 26),
          const CustomDashboardAdminItem(
            color: MyColors.primaryColor,
            count: 6,
            title: 'Total Sellers',
          ),
          const SizedBox(height: 28),
          CustomDashboardAdminItem(
            color: MyColors.primaryColor2,
            count: 6,
            title: 'Total Clients',
          ),
        ],
      ),
    );
  }
}
