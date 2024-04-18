import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({super.key});

  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int _current = 0;
  List<String> listImages = [
    'assets/images/products/1.jpg',
    'assets/images/products/2.jpg',
    'assets/images/products/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
            height: MediaQuery.of(context).size.height * .42,
            autoPlay: false,
            onPageChanged: (index, reason) {
              _current = index;
              setState(() {});
            },
          ),
          items: listImages.map((i) {
            return Builder(
              // builder: (context) => CustomImagePlaceView(image: i),
              builder: (context) => Image.asset(
                i,
                // height: 370,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 5),
        AnimatedSmoothIndicator(
          activeIndex: _current,
          count: listImages.length,
          effect: const ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.black,
              dotColor: Colors.black12),
        ),
      ],
    );
  }
}
