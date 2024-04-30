import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/functions/validator_function.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomTextFieldCoupon extends StatelessWidget {
  const CustomTextFieldCoupon({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    // this.controller,

    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.onSaved,
    this.borderColor = MyColors.textFieldColor,
    this.borderRaduis = 12,
    this.contentPadding =
        const EdgeInsets.only(bottom: 18, top: 18, left: 18, right: 18),
    this.autofocus = false,
    this.onFieldSubmitted,
    this.suffixOnTap,
  });
  // final TextEditingController? controller;
  final int maxLines;
  final Color borderColor;
  final double borderRaduis;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final Function(String?)? onSaved;
  final EdgeInsetsGeometry contentPadding;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  final void Function()? suffixOnTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.textFieldColor,
          // MyColors.textFieldColor
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: suffixOnTap,
                child: ItemHasPadding(
                  horPadding: kHorPadding,
                  child: Text(
                    'Apply',
                    style: Styles.style16.copyWith(
                      color: MyColors.hintColorTextField,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Iconify(
              kCouponIcon,
              color: MyColors.hintColorTextField,
              size: 20,
            ),
          ),
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
        color: color ?? Colors.white,
      ),
    );
  }
}
