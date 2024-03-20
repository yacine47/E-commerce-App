import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/widgets/custom_page_view_model.dart';
import 'package:flutter/widgets.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
            aspectRatio: MediaQuery.of(context).size.width,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              children: [
                CustomPageViewModel(
                  title: 'Buy online',
                  subTitle:
                      'shop online at your favorite retail stores as you normally do',
                  image: MyAssets.imageIntro1,
                ),
                CustomPageViewModel(
                  title: 'Delivery',
                  subTitle:
                      'Wherever you are in this country, we will ship to you.',
                  image: MyAssets.imageIntro2,
                ),
                CustomPageViewModel(
                  title: 'Let’s get Started',
                  subTitle:
                      'shop online at your favorite retail stores as you normally do',
                  image: MyAssets.imageIntro3,
                ),
              ],
            ),
          );
  }
}