import 'package:ecommerce_app/core/functions/validator_function.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFieldSignIn extends StatelessWidget {
  const CustomTextFieldSignIn({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    this.keyboardType,
    this.onPressed,
    this.suffixIcon,
    this.onSaved, this.controller,
  });

  final int maxLines;
  final Function(String?)? onSaved;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.textFieldColor,
          // MyColors.textFieldColor
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Icon(
              suffixIcon,
              size: 20,
              color: MyColors.subTitleColor,
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
