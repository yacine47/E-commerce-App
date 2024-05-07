import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item_my_order_list_view.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderClientViewBody extends StatelessWidget {
  const OrderClientViewBody({super.key});

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
                CustomAppBar(title: 'My Orders'),
                SizedBox(height: 24),
                CategoryItemMyOrderListView(),
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
            builder: (context, state) {
              if (state is GetOrdersSuccess) {
                return OrderListView(
                  orders: state.orders,
                );
              } else if (state is GetOrdersFailure) {
                return CustomFailureWidget(errMessage: state.errMessage);
              }
              return const CustomLoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
