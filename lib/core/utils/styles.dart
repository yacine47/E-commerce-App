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

  static TextStyle style35 = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w600,
  );

  static TextStyle style48 = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
  );

  static TextStyle style14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: MyColors.hintColorTextField,
  );
}
