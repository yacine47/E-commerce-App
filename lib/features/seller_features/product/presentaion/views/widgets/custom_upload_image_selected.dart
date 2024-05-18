import 'dart:io';

import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomUploadImageSelected extends StatelessWidget {
  const CustomUploadImageSelected(
      {super.key, required this.image, required this.onTap});
  final File image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(
            image,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
          ),
        ),
        Positioned(
          top: -2,
          right: -3,
          child: GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: MyColors.primaryColor2,
              radius: 8,
              child: const Icon(
                Icons.close,
                size: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
