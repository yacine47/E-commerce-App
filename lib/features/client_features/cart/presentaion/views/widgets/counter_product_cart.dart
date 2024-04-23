import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/counter_item.dart';
import 'package:flutter/material.dart';

class CounterProductCart extends StatelessWidget {
  const CounterProductCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterItem(
          backgroundColor: MyColors.hintColorTextField,
          iconify: kRemoveIcon,
        ),
        const SizedBox(width: 16),
        Text('2',
            style: Styles.style14
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(width: 16),
        CounterItem(
          backgroundColor: MyColors.primaryColor2,
          iconify: kAddIcon,
        ),
      ],
    );
  }
}
