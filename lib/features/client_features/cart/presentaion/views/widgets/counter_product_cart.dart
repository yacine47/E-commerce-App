import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/counter_item.dart';
import 'package:flutter/material.dart';

class CounterProductCart extends StatefulWidget {
  const CounterProductCart({
    super.key,
  });

  @override
  State<CounterProductCart> createState() => _CounterProductCartState();
}

class _CounterProductCartState extends State<CounterProductCart> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterItem(
          onTap: () {
            if (counter > 1) {
              counter--;
              setState(() {});
            }
          },
          backgroundColor: MyColors.hintColorTextField,
          iconify: kRemoveIcon,
        ),
        const SizedBox(width: 16),
        Text('$counter',
            style: Styles.style14
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(width: 16),
        CounterItem(
          onTap: () {
            counter++;
            setState(() {});
          },
          backgroundColor: MyColors.primaryColor2,
          iconify: kAddIcon,
        ),
      ],
    );
  }
}
