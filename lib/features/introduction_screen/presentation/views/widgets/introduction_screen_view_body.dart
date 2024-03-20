import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/custom_animated_page_indicator.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/custom_page_view_model.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/introduction_screen_actions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroductionScreenViewBody extends StatefulWidget {
  const IntroductionScreenViewBody({super.key});

  @override
  State<IntroductionScreenViewBody> createState() =>
      _IntroductionScreenViewBodyState();
}

class _IntroductionScreenViewBodyState
    extends State<IntroductionScreenViewBody> {
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  int currentIndex = 0;
  late PageController _pageViewController;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .665,
          child: AspectRatio(
            aspectRatio: MediaQuery.of(context).size.width,
            child: PageView(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              scrollDirection: Axis.horizontal,
              controller: _pageViewController,
              children: CustomPageViewModel.listPageViewModel,
            ),
          ),
        ),
        const SizedBox(height: 49),
        CustomanimatedPageIndicator(
          currentIndex: currentIndex,
        ),
        const SizedBox(height: 36),
        IntroductionScreenActions(
          currentIndex: currentIndex,
          onPressedNextButton: () {
            currentIndex++;
            _pageViewController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
            setState(() {});
          },
          onPressedPush: () {
            GoRouter.of(context).push(LoginView.path);
          },
        ),
      ],
    );
  }
}
