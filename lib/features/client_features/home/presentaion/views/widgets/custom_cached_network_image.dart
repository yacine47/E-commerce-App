


import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/functions/get_image_from_url.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key, required this.path,
    // required this.productModel,
  });

  // final ProductModel productModel;
  final String path;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: getImageFromUrl(path),
      placeholder: (context, url) => const CustomLoadingImage(),
      errorWidget: (context, url, error) =>
          const CustomLoadingImage(),
      fit: BoxFit.cover,
    );
  }
}
