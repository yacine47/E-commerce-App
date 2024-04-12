import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class TitleItems extends StatelessWidget {
  const TitleItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Text(
        'Popular',
        style: Styles.style16
            .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
      ),
    );
  }
}
