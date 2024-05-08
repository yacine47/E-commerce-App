import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/all_order_item_delivred_cubit/all_order_item_delivred_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/review_notification_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationReviewDeliveredViewBody extends StatelessWidget {
  const NotificationReviewDeliveredViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          const SizedBox(height: 26),
          const CustomAppBar(
            title: 'Reviews',
          ),
          const SizedBox(height: 36),
          BlocBuilder<AllOrderItemDelivredCubit, AllOrderItemDelivredState>(
            builder: (context, state) {
              if (state is AllOrderItemDelivredSuccess) {
                return  ReviewNotificationListViewItem(
                  orderItemsDelivred: state.orderItems,
                );
              } else if (state is AllOrderItemDelivredFailure) {
                return CustomFailureWidget(errMessage: state.errMessage);
              }
              return const CustomLoadingWidget();
            },
          )
        ],
      ),
    );
  }
}
