import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomDashboardAdminItem extends StatelessWidget {
  const CustomDashboardAdminItem({
    super.key,
    required this.color,
    required this.title,
    required this.count,
  });
  final Color color;
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 386 / 104,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        // height: MediaQuery.of(context).size.height * .1,
        child: Row(
          children: [
            const SizedBox(width: 17),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: Iconify(
                kUsersIcon,
                size: 38,
              ),
            ),
            const SizedBox(width: 22),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.style20.copyWith(color: Colors.white),
                ),
                Text(
                  count.toString(),
                  style: Styles.style24.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
