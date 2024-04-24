import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/product_by_category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryItemListView extends StatefulWidget {
  const CategoryItemListView({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  State<CategoryItemListView> createState() => _CategoryItemListViewState();
}

class _CategoryItemListViewState extends State<CategoryItemListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
              onTap: () {
                currentIndex = index;
                BlocProvider.of<ProductByCategoryCubit>(context)
                    .getProductByCategory(index + 1);
                setState(() {});
              },
              isActive: currentIndex == index,
              name: widget.categories[index].name,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: widget.categories.length),
    );
  }
}
