import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomAddFeaturesItem extends StatelessWidget {
  const CustomAddFeaturesItem({
    super.key,
    this.onTap,
    required this.title,
    required this.color, required this.icon,
  });
  final VoidCallback? onTap;
  final String title;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color,
            child:  Iconify(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styles.style18.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
