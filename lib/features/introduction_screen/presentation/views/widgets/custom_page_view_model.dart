import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/widgets.dart';

class CustomPageViewModel extends StatelessWidget {
  const CustomPageViewModel({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  static List<CustomPageViewModel> listPageViewModel = [
    CustomPageViewModel(
      title: 'Buy online',
      subTitle: 'shop online at your favorite retail stores as you normally do',
      image: MyAssets.imageIntro1,
    ),
    CustomPageViewModel(
      title: 'Delivery',
      subTitle: 'Wherever you are in this country, we will ship to you.',
      image: MyAssets.imageIntro2,
    ),
    CustomPageViewModel(
      title: 'Let’s get Started',
      subTitle: 'shop online at your favorite retail stores as you normally do',
      image: MyAssets.imageIntro3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 22),
              Text(
                title,
                style: Styles.style35.copyWith(fontSize: 31),
              ),
              const SizedBox(height: 6),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Styles.style20.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
        const Spacer(),
        Image.asset(image),
      ],
    );
  }
}
