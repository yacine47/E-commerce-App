

import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:flutter/material.dart';

class CustomLoadingImage extends StatelessWidget {
  const CustomLoadingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(MyAssets.loadingImage),
        ),
      ),
    );
  }
}
