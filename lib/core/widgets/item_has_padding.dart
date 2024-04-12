import 'package:flutter/material.dart';

class ItemHasPadding extends StatelessWidget {
  const ItemHasPadding({super.key, required this.child, required this.horPadding,this.verPadding = 0});
  final Widget child;
  final double horPadding;
  final double verPadding;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horPadding,vertical:verPadding),
      child: child,
    );
  }
}
