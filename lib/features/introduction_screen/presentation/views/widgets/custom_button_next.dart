import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButtonNext extends StatelessWidget {
  const CustomButtonNext({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .35,
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
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
        child: Text(
          'Next',
          style: Styles.style16,
        ),
      ),
    );
  }
}
