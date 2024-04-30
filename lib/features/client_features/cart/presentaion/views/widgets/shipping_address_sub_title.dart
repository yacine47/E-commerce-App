import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ShippingAddressSubTitle extends StatelessWidget {
  const ShippingAddressSubTitle({
    super.key,
    required this.subTitle,
  });
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: Styles.style12.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
