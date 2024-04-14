

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.iconName,
      required this.padRight,
      this.onTap,
      this.color = Colors.white,
      this.backgroundColor = const Color.fromARGB(82, 56, 56, 56)});
  final String iconName;
  final double padRight;
  final Color color;
  final Color backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: 22,
        child: Padding(
          padding: EdgeInsets.only(right: padRight),
          child: Iconify(
            iconName,
            size: 24,
            color: color,
          ),
        ),
      ),
    );
  }
}
