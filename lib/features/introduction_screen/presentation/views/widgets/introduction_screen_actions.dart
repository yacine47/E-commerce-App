import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/custom_button_get_started.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/custom_button_next.dart';
import 'package:flutter/material.dart';

class IntroductionScreenActions extends StatelessWidget {
  const IntroductionScreenActions({
    super.key,
    required this.currentIndex,
    this.onPressedNextButton,
    this.onPressedPush,
  });
  final int currentIndex;
  final void Function()? onPressedNextButton;
  final void Function()? onPressedPush;
  @override
  Widget build(BuildContext context) {
    return currentIndex < 2
        ? Column(
            children: [
              CustomButtonNext(
                onPressed: onPressedNextButton,
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: onPressedPush,
                child: Text(
                  'Skip',
                  style: Styles.style20,
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButtonGetStarted(
              title: 'Get Started',
              onPressed: onPressedPush,
            ),
          );
  }
}
