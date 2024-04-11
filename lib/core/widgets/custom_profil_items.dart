import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomProfielItems extends StatelessWidget {
  const CustomProfielItems(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.onTap});
  final String title;
  final String subTitle;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Row(
          children: [
            Iconify(
              icon,
              size: 24,
            ),
            // const Icon(
            //   IconlyLight.activity,
            //   size: 24,
            // ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // SizedBox(height: 4)
                Text(
                  subTitle,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 'Profiel Settings' -- 'Update and modify your profil' --  kProfileIcon