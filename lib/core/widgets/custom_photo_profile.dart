import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPhotoProfile extends StatelessWidget {
  const CustomPhotoProfile(
      {super.key, required this.photo, required this.size});
  final String photo;
  final double size;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(555),
      child: CircleAvatar(
          radius: size,
          backgroundColor: Colors.transparent,
          child: CustomCachedNetworkImage(
            path: photo,
          )),
    );
  }
}
