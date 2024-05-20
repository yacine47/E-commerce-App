import 'package:ecommerce_app/features/seller_features/orders/data/models/order_item_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_datails_view_body.dart';
import 'package:flutter/material.dart';

class SellerOrderDetailsView extends StatelessWidget {
  const SellerOrderDetailsView({super.key, required this.orderItemModel});
  static String path = '/SellerOrderDetailsView';
  final OrderItemModel orderItemModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SellerOrderDetailsViewBody(
        orderItemModel: orderItemModel,
      )),
    );
  }
}
