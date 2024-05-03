import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/address_view_body.dart';
import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key, this.onCreateAddress});
   final VoidCallback? onCreateAddress;

  static String path = '/AddressView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AddressViewBody(),
      ),
    );
  }
}
