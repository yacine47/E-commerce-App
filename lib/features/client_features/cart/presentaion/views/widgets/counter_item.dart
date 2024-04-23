import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CounterItem extends StatelessWidget {
  const CounterItem({
    super.key,
    required this.backgroundColor,
    required this.iconify, this.onTap,
  });
  final Color backgroundColor;
  final String iconify;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: backgroundColor,
        child: Iconify(
          iconify,
          size: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
