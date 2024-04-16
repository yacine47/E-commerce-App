import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_icon_search.dart';
import 'package:flutter/material.dart';

import 'package:iconify_flutter/iconify_flutter.dart';

class CustomAppBarViewAll extends StatelessWidget {
  const CustomAppBarViewAll(
      {super.key, required this.title, this.colorTitle = Colors.black});
  final String title;
  final Color colorTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CustomIconButtonSearch(
            radius: 22,
            widget: Iconify(
              kBackIcon,
              size: 22,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 26),
        Text(
          title,
          style: TextStyle(
            fontSize: 21,
            color: colorTitle,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
