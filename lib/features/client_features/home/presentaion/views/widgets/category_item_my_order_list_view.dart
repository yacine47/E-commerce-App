import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryItemMyOrderListView extends StatefulWidget {
  const CategoryItemMyOrderListView({
    super.key,
  });

  @override
  State<CategoryItemMyOrderListView> createState() =>
      _CategoryItemMyOrderListViewState();
}

class _CategoryItemMyOrderListViewState
    extends State<CategoryItemMyOrderListView> {
  int currentIndex = 0;
  List<String> myOrderCategories = [
    'All',
    'On Going',
    'Completed',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
              onTap: () {
                currentIndex = index;

                setState(() {});
              },
              isActive: currentIndex == index,
              name: myOrderCategories[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: myOrderCategories.length),

      // child: Row(
      //   children: [
      //     Row(
      //       children: [
      //         CategoryItemMyOrder(name: 'All'),
      //         CategoryItemMyOrder(name: 'Ongoing'),
      //         CategoryItemMyOrder(name: 'Completed'),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
