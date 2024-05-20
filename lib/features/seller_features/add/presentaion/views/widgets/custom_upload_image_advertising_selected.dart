import 'dart:io';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomUploadImageAdvertisingSelected extends StatelessWidget {
  const CustomUploadImageAdvertisingSelected(
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width *
                129 /
                (MediaQuery.of(context).size.width - (kHorPadding * 2)),
          ),
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
