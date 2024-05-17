import 'package:flutter/material.dart';

class CustomCardItemHasHeight extends StatelessWidget {
  const CustomCardItemHasHeight({
    super.key,
    required this.child,
    this.isTransparent = false,
    required this.hieght,
  });
  final Widget child;
  final bool isTransparent;
  final double hieght;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: isTransparent == false
            ? [
                const BoxShadow(
                    blurRadius: 20,
                    color: Color.fromARGB(20, 0, 0, 0),
                    offset: Offset(2.0, 4.0),
                    blurStyle: BlurStyle.normal),
              ]
            : [],
      ),
      child: Card(
        shadowColor: Colors.transparent,
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
          child: child,
        ),
      ),
    );
  }
}

class CustomCardItem extends StatelessWidget {
  const CustomCardItem({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 20,
            color: Color.fromARGB(20, 0, 0, 0),
            offset: Offset(2.0, 4.0),
            blurStyle: BlurStyle.normal),
      ]),
      child: Card(
        shadowColor: Colors.transparent,
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
          ),
          child: child,
        ),
      ),
    );
  }
}
