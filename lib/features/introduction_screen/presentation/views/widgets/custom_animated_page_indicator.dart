import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomanimatedPageIndicator extends StatelessWidget {
  const CustomanimatedPageIndicator({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      axisDirection: Axis.horizontal,
      activeIndex: currentIndex,
      count: 3,
      effect: ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: MyColors.primaryColor,
        dotColor: MyColors.lighBackgroundColor,
      ),
    );
  }
}
