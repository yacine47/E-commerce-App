import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSupplementTextField extends StatelessWidget {
  const CustomSupplementTextField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    // this.controller,

    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.borderColor = MyColors.textFieldColor,
    this.borderRaduis = 12,
    this.contentPadding =
        const EdgeInsets.only(bottom: 18, top: 18, left: 18, right: 18),
    this.autofocus = false,
    this.onFieldSubmitted,
  });
  // final TextEditingController? controller;
  final int maxLines;
  final Color borderColor;
  final double borderRaduis;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;

  final EdgeInsetsGeometry contentPadding;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      onChanged: onChanged,
      maxLines: maxLines,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.textFieldColor,
          contentPadding: contentPadding,
          hintText: hint,
          label: Text(
            hint,
            style: Styles.style14,
          ),
          hintStyle: TextStyle(color: MyColors.hintColorTextField),
          border: buildBorder(),
          enabledBorder: buildBorder(color: borderColor),
          focusedBorder: buildBorder(color: borderColor)),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis),
      borderSide: BorderSide(
        color: MyColors.borderCategoryColor,
      ),
    );
  }
}
