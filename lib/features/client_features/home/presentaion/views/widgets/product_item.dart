import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Color.fromARGB(20, 0, 0, 0),
              offset: Offset(2.0, 4.0),
              blurStyle: BlurStyle.normal),
        ]),
        child: Card(
          elevation: 0,
          shadowColor: Colors.transparent,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 180 / 143,
                  child: Image.asset('assets/images/Rectangle 5676.png')),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Laptop Asus VivoBok 15',
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          const Icon(
                            IconlyBold.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '4.6 (249)',
                            style: Styles.style12,
                          )
                        ],
                      ),
                      Text(
                        '45,000 DZD',
                        style: Styles.style16.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
