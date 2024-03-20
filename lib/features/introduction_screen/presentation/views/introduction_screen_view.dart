import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/introduction_screen_view_body.dart';
import 'package:flutter/material.dart';

class IntroductionScreenView extends StatelessWidget {
  const IntroductionScreenView({super.key});
  static String path = '/IntroductionScreenView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: IntroductionScreenViewBody(),
      ),
    );
  }
}
