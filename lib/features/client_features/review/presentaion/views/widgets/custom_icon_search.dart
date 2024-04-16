import 'package:flutter/material.dart';

class CustomIconButtonSearch extends StatelessWidget {
  const CustomIconButtonSearch(
      {super.key, required this.widget, this.radius = 24});
  final Widget widget;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(555),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(3, 5), // changes position of shadow
          ),
        ],
      ),
      child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.white,
          child: Center(child: widget)),
    );
  }
}
