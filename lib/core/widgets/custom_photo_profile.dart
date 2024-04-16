


import 'package:flutter/material.dart';

class CustomPhotoProfile extends StatelessWidget {
  const CustomPhotoProfile({super.key, required this.photo, required this.size});
  final String photo;
  final double size;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(555),
      child: Image.asset(
        photo,
        alignment: const Alignment(0, .6),
        fit: BoxFit.cover,
        width: size,
        height: size,
      ),
    );
  }
}
