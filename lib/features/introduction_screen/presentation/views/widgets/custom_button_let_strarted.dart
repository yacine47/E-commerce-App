import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonGetStarted extends StatelessWidget {
  const CustomButtonGetStarted({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 58,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(555),
          border: Border.all(color: Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff00CDBD).withOpacity(.2),
              offset: const Offset(6, 6),
              blurRadius: 20,
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
          ),
          child: Text(
            'Get Started',
            style: Styles.style16,
          ),
        ),
      ),
    );
  }
}
