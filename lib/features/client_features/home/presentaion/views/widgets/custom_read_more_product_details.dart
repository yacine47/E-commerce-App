import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreProductDetails extends StatelessWidget {
  const CustomReadMoreProductDetails({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 7,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read More.',
      trimExpandedText: ' Show Less.',
      style: Styles.style14.copyWith(height: 1.6, fontWeight: FontWeight.w600),
      moreStyle: Styles.style14
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      lessStyle: Styles.style14
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
    );
  }
}
