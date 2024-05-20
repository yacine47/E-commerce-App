import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/seller_order_cubit/seller_order_cubit.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerOrderView extends StatefulWidget {
  const SellerOrderView({super.key});

  static String path = '/SellerOrderView';

  @override
  State<SellerOrderView> createState() => _SellerOrderViewState();
}

class _SellerOrderViewState extends State<SellerOrderView> {
  @override
  void initState() {
    BlocProvider.of<SellerOrderCubit>(context).getSellerOrders(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SellerOrderViewBody(),
      ),
    );
  }
}
