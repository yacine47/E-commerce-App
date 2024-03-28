import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AutherOption extends StatelessWidget {
  const AutherOption(
      {super.key,
      required this.text,
      required this.buttonText,
      required this.onTap});
  final String text;
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(text: '$text  ', style: Styles.style14, children: [
          TextSpan(
            text: ' $buttonText',
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: Styles.style14.copyWith(
              color: MyColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );
  }
}
