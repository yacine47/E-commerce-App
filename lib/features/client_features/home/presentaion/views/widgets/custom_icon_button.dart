import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconName,
    required this.padRight,
    this.onTap,
    this.color = Colors.black,
  });
  final String iconName;
  final double padRight;
  final Color color;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Iconify(
        iconName,
        size: 28,
        color: color,
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:iconly/iconly.dart';

// class GoBackButton extends StatelessWidget {
//   const GoBackButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () => GoRouter.of(context).pop(),
//         child: const Icon(IconlyLight.arrow_left, size: 28));
//   }
// }
