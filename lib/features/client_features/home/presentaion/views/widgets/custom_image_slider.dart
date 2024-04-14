import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_product_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({super.key});

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int _current = 0;
  List<String> listImagesPlace = [
    'assets/images/products/1.jpg',
    'assets/images/products/2.jpg',
    'assets/images/products/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            clipBehavior: Clip.none,
            autoPlayCurve: Curves.fastOutSlowIn,
            // autoPlayInterval: const Duration(seconds: 3),
            // autoPlayAnimationDuration: const Duration(milliseconds: 800),
            // enlargeCenterPage: true,
            enlargeFactor: 0.3,
            viewportFraction: 1,
            height: 370,
            autoPlay: false,
            onPageChanged: (index, reason) {
              _current = index;
              setState(() {});
            },
          ),
          items: listImagesPlace.map((i) {
            return Builder(
              builder: (context) => CustomImagePlaceView(image: i),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 12,
          child: AnimatedSmoothIndicator(
            activeIndex: _current,
            count: 3,
            effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.black,
                dotColor: Colors.black12),
          ),
        )
      ],
    );
  }
}
