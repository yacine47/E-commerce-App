import 'dart:io';

import 'package:ecommerce_app/core/models/image_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomUploadImageSelectedEditProduct extends StatelessWidget {
  const CustomUploadImageSelectedEditProduct(
      {super.key, required this.image, required this.onTap});
  final dynamic image;
  final VoidCallback onTap;

  Widget displayImage(context) {
    if (image is File) {
      return Image.file(
        image,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.width / 4,
      );
    } else if (image is ImageModel) {
      return SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 4,
          child: CustomCachedNetworkImage(
            path: image.path as String,
          ));
    }
    return Container(
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: displayImage(context),
        ),
        Positioned(
          top: -2,
          right: -3,
          child: GestureDetector(
            onTap: onTap,
            child: const CircleAvatar(
              backgroundColor: MyColors.primaryColor,
              radius: 8,
              child: Icon(
                Icons.close,
                size: 12,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
