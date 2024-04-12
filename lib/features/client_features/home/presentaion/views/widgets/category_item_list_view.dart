
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryItemListView extends StatelessWidget {
  const CategoryItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 33,
          child: ListView(
            padding: const EdgeInsets.only(left: kHorPadding),
            scrollDirection: Axis.horizontal,
            children: const [
              CategoryItem(name: 'All Items', isActive: true),
              SizedBox(width: 15),
              CategoryItem(name: 'Dress'),
              SizedBox(width: 15),
              CategoryItem(name: 'Camera'),
              SizedBox(width: 15),
              CategoryItem(name: 'Watch'),
              SizedBox(width: 15),
              CategoryItem(name: 'Camera'),
            ],
          ),
        );
  }
}