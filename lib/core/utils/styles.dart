import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle style16 = const TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle style20 = TextStyle(
    fontSize: 20,
    color: MyColors.subTitleColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle style18 = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle style24 = const TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle style35 = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
  );

  static TextStyle style40 = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style44 = const TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: MyColors.hintColorTextField,
  );

  static TextStyle style13 = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle style12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: MyColors.hintColorTextField,
  );
  static TextStyle style10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: MyColors.hintColorTextField,
  );
}
