import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_items_list_view.dart';
import 'package:flutter/material.dart';

class SellerOrderListView extends StatelessWidget {
  const SellerOrderListView({
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
      itemBuilder: (context, index) => SellerOrderItemsListView(
        products: orders[index].products!,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemCount: orders.length,
    );
  }
}
