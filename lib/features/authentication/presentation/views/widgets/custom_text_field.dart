import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    // this.controller,

    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.suffixIcon,
    required this.prefixIcon,
  });
  // final TextEditingController? controller;
  final int maxLines;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.textFieldColor,
          // MyColors.textFieldColor

          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onPressed,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      suffixIcon,
                      size: 20,
                    ),
                  ),
                )
              : const SizedBox(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              prefixIcon,
              color: MyColors.hintColorTextField,
              size: 20,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(bottom: 18, top: 18, left: 18, right: 18),
          hintText: hint,
          label: Text(
            hint,
            style: Styles.style14,
          ),
          hintStyle: TextStyle(color: MyColors.hintColorTextField),
          border: buildBorder(),
          enabledBorder: buildBorder(color: MyColors.textFieldColor),
          focusedBorder: buildBorder(
            color: MyColors.textFieldColor,
          )),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
