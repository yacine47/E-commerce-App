import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/functions/get_image_from_url.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomImageSlider extends StatefulWidget {
  const CustomImageSlider({super.key, required this.images});
  final List<ImageModel> images;
  @override
  State<CustomImageSlider> createState() => _CustomImageSliderState();
}

class _CustomImageSliderState extends State<CustomImageSlider> {
  int _current = 0;

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
          items: widget.images.map((i) {
            return Builder(
              // builder: (context) => CustomImagePlaceView(image: i),
              builder: (context) => Image.network(
                getImageFromUrl(i.path!),
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
          count: widget.images.length,
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
