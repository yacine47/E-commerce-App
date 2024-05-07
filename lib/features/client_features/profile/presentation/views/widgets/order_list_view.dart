import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/order_item_list_view.dart';
import 'package:flutter/material.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({
    super.key,
    required this.orders,
  });
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // padding: const EdgeInsets.symmetric(horizontal: kHorPadding, vertical: 8),
      itemBuilder: (context, index) => OrderItemsListView(
        products: orders[index].products!,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemCount: orders.length,
    );
  }
}
