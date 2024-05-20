import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/seller_order_cubit/seller_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItemOrderSellerListView extends StatefulWidget {
  const CategoryItemOrderSellerListView({
    super.key,
  });

  @override
  State<CategoryItemOrderSellerListView> createState() =>
      _CategoryItemOrderSellerListViewState();
}

class _CategoryItemOrderSellerListViewState
    extends State<CategoryItemOrderSellerListView> {
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
                BlocProvider.of<SellerOrderCubit>(context).getSellerOrders(index);
                BlocProvider.of<SellerOrderCubit>(context).indexOrder = index;
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
