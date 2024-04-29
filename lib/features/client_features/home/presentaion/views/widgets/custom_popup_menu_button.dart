


import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SizedProductItem extends StatelessWidget {
  const SizedProductItem({
    super.key,
    required this.hint,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 13,
        backgroundColor: Colors.white,
        child: Text(
          hint,
          style: Styles.style16
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
