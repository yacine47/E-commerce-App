import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/seller_order_cubit/seller_order_cubit.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/category_item_order_seller_list_view.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerOrderViewBody extends StatelessWidget {
  const SellerOrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: ItemHasPadding(
            horPadding: kHorPadding,
            child: Column(
              children: [
                SizedBox(height: 23),
                CustomAppBar(title: 'Orders'),
                SizedBox(height: 24),
                CategoryItemOrderSellerListView(),
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<SellerOrderCubit, SellerOrderState>(
            builder: (context, state) {
              if (state is SellerOrderSuccess) {
                return SellerOrderListView(
                  orders: state.orders,
                );
              } else if (state is SellerOrderFailure) {
                return CustomFailureWidget(errMessage: state.errMessage);
              }
              return const Padding(
                padding: EdgeInsets.only(top: 24),
                child: CustomLoadingWidget(),
              );
            },
          ),
        ),
      ],
    );
  }
}
