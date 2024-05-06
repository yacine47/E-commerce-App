import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/advertising_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/store_seller_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAds extends StatefulWidget {
  const CustomAds({
    super.key,
    required this.advertisings,
  });
  final List<AdvertisingModel> advertisings;

  @override
  State<CustomAds> createState() => _CustomAdsState();
}

class _CustomAdsState extends State<CustomAds> {
  // final List<String> listImageCover = [
  //   MyAssets.ads1,
  //   MyAssets.ads2,
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 129,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        // disableGesture: false,
        options: CarouselOptions(
          // pauseAutoPlayInFiniteScroll: false,
          // height: 129,
          // aspectRatio: 1 / 2,
          viewportFraction: 0.9,
          // viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: widget.advertisings.map((ads) {
          return GestureDetector(
            onTap: () =>
                GoRouter.of(context).push(StoreSellerView.path, extra: ads),
            child: Builder(
              builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomCachedNetworkImage(
                    path: ads.coverAdsImage!,
                  )),
            ),
          );
        }).toList(),
      ),
    );
  }
}
