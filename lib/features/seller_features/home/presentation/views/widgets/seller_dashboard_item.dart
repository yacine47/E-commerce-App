import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SellerDashboardItem extends StatelessWidget {
  const SellerDashboardItem({
    super.key,
    required this.icon,
    required this.count,
    required this.title,
    this.onTap,
  });

  final IconData icon;
  final int count;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Color.fromARGB(15, 0, 0, 0),
              offset: Offset(2, 4),
              blurStyle: BlurStyle.normal),
        ]),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
              ),
              const SizedBox(height: 8),
              Text(
                count.toString(),
                style: Styles.style24,
              ),
              Text(
                title,
                style: Styles.style20.copyWith(
                  color: MyColors.hintColorTextField,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
