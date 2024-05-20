import 'package:ecommerce_app/features/seller_features/add/presentaion/views/widgets/add_advertising_view_body.dart';
import 'package:flutter/material.dart';

class AddAdvertisingView extends StatelessWidget {
  const AddAdvertisingView({super.key});
  static String path = '/AddAdvertisingView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddAdvertisingViewBody(),
      ),
    );
  }
}
