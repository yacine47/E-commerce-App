import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {
  const CircleBackground(
      {super.key,
      required this.child,
      this.paddingHorizontal = kSpaceBetweenTextField});
  final Column child;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
         Positioned(
          top: -500,
          child: CircleAvatar(
            backgroundColor: MyColors.primaryColor,
            radius: 400,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ],
    );
  }
}

class CircleBackgroundRightDir extends StatelessWidget {
  const CircleBackgroundRightDir(
      {super.key, required this.child, this.paddingHorizontal = kHorPadding});
  final Widget child;
  final double paddingHorizontal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: -320,
          // righ: -100,
          right: -80,
          child: CircleAvatar(
            backgroundColor: MyColors.primaryColor,
            radius: 240,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal + 22),
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      ],
    );
  }
}
